package com.springstudy.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gmk.framework.common.config.Global;
import com.gmk.framework.common.utils.FileUtils;
import com.gmk.framework.common.utils.HttpClientUtils;
import com.gmk.framework.common.utils.Identities;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import uk.co.techblue.alfresco.commons.AlfrescoConstants;
import uk.co.techblue.alfresco.dto.AuthResponse;
import uk.co.techblue.alfresco.dto.Credentials;
import uk.co.techblue.alfresco.dto.content.*;
import uk.co.techblue.alfresco.exception.AuthenticationException;
import uk.co.techblue.alfresco.exception.ContentException;
import uk.co.techblue.alfresco.service.AuthService;
import uk.co.techblue.alfresco.service.ContentService;
import uk.co.techblue.alfresco.service.FolderService;

import javax.activation.FileDataSource;
import java.io.File;

/**
 * Created by zzh on 2014/7/16.
 */
public class AlfrescoClientUtils {

    private static Logger logger = LoggerFactory.getLogger(AlfrescoClientUtils.class);

    private static Credentials getCredentials() {
        return new Credentials(Global.getConfig("alfresco.username"), Global.getConfig("alfresco.password"));
    }

    private static String getToken(Credentials credentials) {
        AuthService authService = new AuthService(Global.getConfig("alfresco.url"), credentials);
        try {
            AuthResponse token = authService.login();
            return token.getAuthenticationData().getAuthenticationToken();
        } catch (AuthenticationException e) {
            logger.error("alfresco登陆用户名密码验证不通过！", e);
            e.printStackTrace();
        }
        return null;
    }

    private static ContentService getContentService() {
        ContentService contentService = new ContentService(Global.getConfig("alfresco.url"),
                getToken(getCredentials()));
        return contentService;
    }

    private static FolderService getFolderService() {
        FolderService folderService = new FolderService(Global.getConfig("alfresco.url"),
                getToken(getCredentials()));
        return folderService;
    }

    /**
     * 文件上传
     *
     * @param fileDataSource
     * @param nodeId
     * @param fileName
     * @return
     */
    public static String uploadContent(FileDataSource fileDataSource, String nodeId, String fileName) {
        ContentUploadForm uploadMetadata = new ContentUploadForm();
        uploadMetadata.setFileData(fileDataSource);
        uploadMetadata.setDestination(AlfrescoConstants.DEFAULT_STORE + "/" + nodeId);
        uploadMetadata.setFileName(fileName);
        try {
            UploadResponse uploadResponse = getContentService().uploadDocument(uploadMetadata);
            if (uploadResponse.getStatus().getCode() == 200) {
                String nodeRef = uploadResponse.getNodeRef();
                int i = nodeRef.lastIndexOf("/");
                return nodeRef.substring(i + 1);
            }
        } catch (ContentException e) {
            logger.error("文件上传失败!", e);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 创建文件夹
     *
     * @param
     * @param nodeId
     * @param folderName
     * @return
     */
    public static String createFolder(String nodeId, String folderName) {
        try {
            FolderRequest folder = new FolderRequest();
            folder.setName(folderName);
            FolderCreationResponse response = getFolderService().createFolder(nodeId, folder);
            String nodeRef = response.getNodeReference();
            int i = nodeRef.lastIndexOf("/");
            return nodeRef.substring(i + 1);

        } catch (ContentException e) {
            logger.error("文件夹创建失败!", e);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 文件下载
     *
     * @param nodeId
     * @return
     */
    public static File getContent(String nodeId) {
        try {
            if (nodeId == null) {
                return null;
            }
            //如果以PDF结尾 就获取转换pdf附件
            if (nodeId.endsWith("PDF")) {
                nodeId = nodeId.substring(0, nodeId.length() - 3);
                nodeId = getPdf(nodeId);
                if (nodeId == null) return null;
            }
            DocumentContent nodeContent = getContentService().getNodeContent(nodeId);
            return nodeContent.getDocFile();
        } catch (ContentException e) {
            logger.error("文件没找到!", e);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除
     *
     * @param nodeId
     * @return
     */
    public static boolean deleteDocument(String nodeId) {
        try {
            String s = getContentService().deleteDocument(nodeId, false);
        } catch (ContentException e) {
            logger.error("文件删除失败!", e);
            e.printStackTrace();
            return false;
        }
        return true;
    }


    /**
     * 保存文件
     *
     * @param file
     * @return
     */
    public static boolean saveFile(MultipartFile file, String filePath) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 转存文件
                file.transferTo(new File(filePath));
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * 文件上传中间环节处理
     *
     * @param file
     * @param nodeId alfresco节点id
     * @param rName  alfresco系统文件显示名称 不用加后缀
     * @return
     */
    public static String upload(MultipartFile file, String nodeId, String rName) {
        String docNodeId = null;
        String fileName = file.getOriginalFilename();
        if (file.isEmpty()) {
            return docNodeId;
        }
        //文件上传文件夹
        String uploadPath = Global.getConfig("uploadPath") + File.separatorChar + "temp";
        FileUtils.createDirectory(uploadPath);

        String strEncode = Identities.uuid2();
        String suffix = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf("."), fileName.length()) : null;
        String newFileName = strEncode + (suffix != null ? suffix : "");
        rName = rName + (suffix != null ? suffix : "");
        String filePath = uploadPath + File.separatorChar + newFileName;
        //文件上传应用服务器
        if (saveFile(file, filePath)) {
            FileDataSource fileDataSource = new FileDataSource(filePath);
            //发送到alfesco系统
            docNodeId = uploadContent(fileDataSource, nodeId, rName);
            FileUtils.deleteFile(filePath);
        }
        return docNodeId;
    }

    /**
     * 根据文件NodeID获取此文件是否存在pdf版本
     *
     * @param nodeId
     * @return
     */
    public static String getPdf(String nodeId) {
        String url = Global.getConfig("alfresco.url") + "/alfresco/service/gmk/getpdf/" + nodeId + "?alf_ticket=" + getToken(getCredentials());
        String get = HttpClientUtils.doGet(url);
        JSONObject jsonObject = JSON.parseObject(get);
        String downUrl = (String) jsonObject.get("downUrl");
        if (downUrl != null && !"".equals(downUrl)) {
            int i = downUrl.lastIndexOf("/");
            return downUrl.substring(i + 1);
        }
        return null;
    }

    /**
     * 文件夹，文档移动
     *
     * @param fromId 移动文件夹或文档id
     * @param toId 目标文件夹id
     * @return
     */
    public static boolean move(String fromId, String toId) {
        String url = Global.getConfig("alfresco.url") + "/alfresco/service/gmk/getmove/" + fromId + "/" + toId + "?alf_ticket=" + getToken(getCredentials());
        String get = HttpClientUtils.doGet(url);
        JSONObject jsonObject = JSON.parseObject(get);
        String state = (String) jsonObject.get("state");
        return "ok".equals(state);
    }


    public static void main(String args[]) throws ContentException {
        //getToken(getCredentials());
        //FileDataSource fileDataSource = new FileDataSource("C:\\WirelessDiagLog.csv");
        //System.out.println(uploadContent(fileDataSource, "01cf0040-fe3b-479d-8260-00a339d7b3c2", "aa.csv"));
        //System.out.println(getContent("fde7ad91-86c6-48db-889a-100146db44c2"));
        //deleteDocument("7f11910a-0a8a-402f-b4b5-e4615301cc8c");
        //createFolder("583b6873-bfc2-4165-a601-2be1068599d7", "测试文件夹");
        // String s = getFolderService().searchFolder("583b6873-bfc2-4165-a601-2be1068599d7", "");
        String nodeId = "{\"downUrl\":\"\"}";
        JSONObject jsonObject = JSON.parseObject(nodeId);
        String downUrl = (String) jsonObject.get("downUrl");

        String s = HttpClientUtils.doPost("http://192.168.5.38:8080/alfresco/service/api/node/workspace/SpacesStore/490bc89a-2d76-4365-b377-7734bf322f22/children?sourceFolderId=84be465b-6eb2-4896-82f7-4a96f8f1c947&versioningState=&alf_ticket=TICKET_58c770914553aa0b2152f4e3c030969ca0d63cac");
        //String s = HttpClientUtils.doPost("http://192.168.5.38:8080/alfresco/service/gmk/move/84be465b-6eb2-4896-82f7-4a96f8f1c947/490bc89a-2d76-4365-b377-7734bf322f22?alf_ticket=TICKET_58c770914553aa0b2152f4e3c030969ca0d63cac");

        System.out.println(s);
    }
}
