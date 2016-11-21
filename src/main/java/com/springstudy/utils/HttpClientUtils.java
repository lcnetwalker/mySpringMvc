package com.springstudy.utils;

import com.gmk.framework.common.exception.HttpClientException;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.Consts;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpVersion;
import org.apache.http.NameValuePair;
import org.apache.http.client.fluent.Request;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by zzh on 2014/7/23.
 */
public class HttpClientUtils {

    private static Logger logger = LoggerFactory.getLogger(HttpClientUtils.class);

    private static int connectionTimeOut = 2000;

    private static int socketTimeOut = 20000;
    /**
     * get请求，返回字符串
     * /api/v1/user
     *
     * @param url
     * @return
     */
    public static String doGet(String url) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut).socketTimeout(socketTimeOut)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * get请求，返回流
     *
     * @param url
     * @return
     */
    public static InputStream doGetInputStream(String url) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut)
                    .execute().returnContent().asStream();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * socketTimeout设置请求超时时间
     * connectTimeout设置连接超时时间
     *
     * @param url
     * @param time
     * @return
     */
    public static String doGet(String url, int time) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut).socketTimeout(time)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * get请求，返回字符串
     *
     * @param url    /api/v1/user
     * @param params Map ?后面的参数
     * @return
     */
    public static String doGet(String url, Map<String, String> params) {
        String makeUrl = makeUrl(url, params);
        try {
            return Request.Get(makeUrl).connectTimeout(connectionTimeOut).socketTimeout(socketTimeOut)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * get请求，返回字符串
     * 需用户名，密码
     *
     * @param url
     * @return
     */
    public static String doGet(String url, String username, String password) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut).socketTimeout(socketTimeOut).addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * get请求，返回流
     * 需用户名，密码
     *
     * @param url
     * @return
     */
    public static InputStream doGetInputStream(String url, String username, String password) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut).addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .execute().returnContent().asStream();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * 设置响应超时时间 connectTimeout
     *
     * @param url
     * @param username
     * @param password
     * @param time
     * @return
     */
    public static String doGet(String url, String username, String password, int time) {
        try {
            return Request.Get(url).addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .connectTimeout(connectionTimeOut).socketTimeout(time).execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * 拼接url 中文需在之前编码转换
     * Encodes.urlEncode("");
     *
     * @param p_url
     * @param params
     * @return
     */
    private static String makeUrl(String p_url, Map<String, String> params) {
        StringBuilder url = new StringBuilder(p_url);
        if (url.indexOf("?") < 0) {
            url.append('?');
        }
        for (String name : params.keySet()) {
            url.append('&');
            url.append(name);
            url.append('=');
            url.append(params.get(name));
        }
        return url.toString().replace("?&", "?");
    }

    /**
     * HttpBasic 加密
     *
     * @param userName
     * @param password
     * @return
     */
    public static String encodeHttpBasic(String userName, String password) {
        String encode = userName + ":" + password;
        return "Basic " + Base64.encodeBase64String(encode.getBytes());
    }

    /**
     * get请求，返回byte
     *
     * @param url
     * @return
     */
    public static byte[] doGetByte(String url) {
        try {
            return Request.Get(url).connectTimeout(connectionTimeOut).socketTimeout(socketTimeOut)
                    .execute().returnContent().asBytes();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * Post请求
     *
     * @param url
     * @return
     */
    public static String doPost(String url) {
        try {
            return Request.Post(url).connectTimeout(connectionTimeOut).useExpectContinue().version(HttpVersion.HTTP_1_1)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * Post，带提交参数 url参数
     *
     * @param url
     * @param params
     * @return
     */
    /*public static String doPostUrl(String url, Map<String, String> params) throws IOException {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String name : params.keySet()) {
            nvps.add(new BasicNameValuePair(name, params.get(name)));
        }
        try {
            return Request.Post(url).useExpectContinue().body(new UrlEncodedFormEntity(nvps))
                    .execute().returnContent().asString();
        } catch (HttpResponseException e) {
            logger.error("Status code:" + e.getStatusCode(), e);
        }
        return null;
    }*/

    /**
     * POST请求，内容为HTML表单类型的请求体
     *
     * @param url
     * @param params
     * @return
     * @throws java.io.IOException
     */
    public static String doPost(String url, Map<String, String> params) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String name : params.keySet()) {
            nvps.add(new BasicNameValuePair(name, params.get(name)));
        }
        try {
            return Request.Post(url).connectTimeout(connectionTimeOut).useExpectContinue().bodyForm(nvps, Consts.UTF_8)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * POST请求，内容为HTML表单类型的请求体
     * 需用户名，密码
     *
     * @param url
     * @param params
     * @param username
     * @param password
     * @return
     * @throws java.io.IOException
     */
    public static String doPost(String url, Map<String, String> params, String username, String password) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String name : params.keySet()) {
            nvps.add(new BasicNameValuePair(name, params.get(name)));
        }
        try {
            return Request.Post(url).connectTimeout(connectionTimeOut).useExpectContinue()
                    .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .bodyForm(nvps, Consts.UTF_8)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * POST请求，内容为HTML表单类型的请求体 有重复name表单
     * 需用户名，密码
     *
     * @param url
     * @param params
     * @param username
     * @param password
     * @return
     * @throws java.io.IOException
     */
    public static String doPost(String url, List<Map<String, String>> params, String username, String password) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (Map<String, String> map : params) {
            for (String name : map.keySet()) {
                nvps.add(new BasicNameValuePair(name, map.get(name)));
            }
        }

        try {
            return Request.Post(url).connectTimeout(connectionTimeOut).useExpectContinue()
                    .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .bodyForm(nvps, Consts.UTF_8)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * Put请求，内容为HTML表单类型的请求体
     * 需用户名，密码
     *
     * @param url
     * @param params
     * @param username
     * @param password
     * @return
     * @throws java.io.IOException
     */
    public static String doPut(String url, Map<String, String> params, String username, String password) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String name : params.keySet()) {
            nvps.add(new BasicNameValuePair(name, params.get(name)));
        }
        try {
            return Request.Put(url).connectTimeout(connectionTimeOut).useExpectContinue()
                    .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .bodyForm(nvps, Consts.UTF_8)
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * Delete请求，内容为HTML表单类型的请求体
     * 需用户名，密码
     *
     * @param url
     * @param params
     * @param username
     * @param password
     * @return
     * @throws java.io.IOException
     */
    public static String doDelete(String url, Map<String, String> params, String username, String password) {
        String makeUrl = makeUrl(url, params);
        try {
            return Request.Delete(makeUrl).connectTimeout(connectionTimeOut).useExpectContinue()
                    .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }

    /**
     * Delete请求，内容为HTML表单类型的请求体
     * 需用户名，密码
     *
     * @param url
     * @param username
     * @param password
     * @return
     * @throws java.io.IOException
     */
    public static String doDelete(String url, String username, String password) {
        try {
            return Request.Delete(url).connectTimeout(connectionTimeOut).useExpectContinue()
                    .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic(username, password))
                    .execute().returnContent().asString();
        } catch (IOException e) {
            throw new HttpClientException(e.getMessage(), e);
        }
    }


    public static void main(String[] args) throws Exception {
        //执行一个GET请求,同时设置Timeout参数并将响应内容作为String返回
       /* System.out.println("==");
        *//*String s = doGet("www.abcdegs.net/sys/user/test2.json");
        System.out.println(s);*//*
        String s = doGet("http://192.168.5.107:8080/sys/menu", "admin", "admin",1000);
        System.out.println(s);

          HttpClientUtils.doGet("http://dev-hr.xiangguang.com/msg/jsonUnProcessedTaskAll", "chaoyun.shen", "5f0f0de3c9db49c1de8044bf2d27cedac95b7c2f081f512a36eb7a51",1000);
*/
//        String s = Request.Get("http://192.168.5.106/msg/jsonUnProcessedTaskAll?num=-1")
//                .addHeader(HttpHeaders.AUTHORIZATION, encodeHttpBasic("chaoyun.shen", "5f0f0de3c9db49c1de8044bf2d27cedac95b7c2f081f512a36eb7a51"))
//                .connectTimeout(1000)
//                .socketTimeout(5000)
//                .execute().returnContent().asString();
//        System.out.println(s);
        //User user = JSON.parseObject(s, User.class);
        //System.out.println(user);
//        String  aa = "{\"admin\":false,\"delFlag\":\"0\",\"email\":\"zonghao.zhang@xiangguang.com\",\"id\":398,\"loginDate\":1398349803000,\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginName\":\"zonghao.zhang\",\"mobile\":\"18866358618\",\"name\":\"张宗毫\",\"no\":\"20000082\",\"password\":\"70f7195b981ecc1d8501b6e0887c7e73256945581da55dc737cc3116\",\"phone\":\"5123456\",\"roleList\":[],\"roleNames\":\"\"}";
//        User user = JSON.parseObject(aa, User.class);
//        System.out.println(user);
//
//        // 子系统 更新用户
//        Map map = new HashMap();
//        String s = JSON.toJSONString(user);
//        map.put("userObject", s);
//            String doPost = HttpClientUtils.doPost("http://w3.xiangguang.com/authapi/v1/user/",
//                    map, "api", "5f0f0de3c9db49c1de8044bf2d27cedac95b7c2f081f512a36eb7a51");
//            JSONObject json = new JSONObject(doPost);
//            String message = (String) json.get("message");
//        System.out.println(message);
        long l = System.currentTimeMillis();
        try {
            doPost("http://test.com");
        } catch (Exception e){

        }
        Long endBegin = System.currentTimeMillis() - l;
        System.out.println("执行耗时:" + endBegin + "毫秒");
    }
}
