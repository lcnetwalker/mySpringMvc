package com.springstudy.utils.email;


import com.gmk.framework.common.utils.StringUtils;

import java.io.File;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by zzh on 14-3-14.
 */
public class Email implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 邮件展示发送者名称 项目名称-（模块名称）
     */
    private String from;

    /**
     * 收件人*
     */
    private String addressee;

    /**
     * 抄送给*
     */
    private String cc;

    /**
     * 邮件主题*
     */
    private String subject;

    /**
     * 选择模版
     */
    private String template;

    /**
     * 邮件内容*
     */
    private String content;

    /**
     * 模版内容
     */
    private Map<String, Object> contentMap;

    /**
     * 附件*
     */
    private List<File> attachment;

    public String getAddressee() {
        return addressee;
    }

    public void setAddressee(String addressee) {
        this.addressee = addressee;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public Map<String, Object> getContentMap() {
        return contentMap;
    }

    public void setContentMap(Map<String, Object> contentMap) {
        this.contentMap = contentMap;
    }

    public List<File> getAttachment() {
        return attachment;
    }

    public void setAttachment(List<File> attachment) {
        this.attachment = attachment;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String[] getAddress() {
        if (!StringUtils.isNotEmpty(this.addressee)) {
            return null;
        }
        addressee = addressee.trim();
        addressee = addressee.replaceAll("；", ";");
        addressee = addressee.replaceAll(" ", ";");
        addressee = addressee.replaceAll(",", ";");
        addressee = addressee.replaceAll("，", ";");
        return addressee.split(";");
    }
}
