package com.springstudy.utils;

import net.paoding.rose.web.Invocation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zzh on 15-4-8.
 */
public class ToolsUtils {

    /**
     * 判断浏览器类型是否是IE,是则返回true,不是返回false
     *
     * @return boolean
     */
    public static boolean isIE(Invocation inv) {
        String userAgent = inv.getRequest().getHeader("USER-AGENT").toLowerCase();
        Pattern p = Pattern.compile("trident.*rv\\:11\\.");//ie11单独验证
        Matcher m = p.matcher(userAgent);
        if (userAgent.indexOf("msie") > 0 || m.find()) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        String userAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64; trident/7.0; Touch; rv:11.0) like Gecko";
        Pattern p = Pattern.compile("trident.*rv\\:11\\.");
        Matcher m = p.matcher(userAgent);
        if (m.find()) {
            System.out.println("34");
        }
    }
}
