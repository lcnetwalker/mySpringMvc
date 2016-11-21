package com.springstudy.utils;

import com.gmk.framework.common.utils.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Util - 字符串
 *
 * @author gmk
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

    /**
     * 替换掉HTML标签方法
     */
    public static String replaceHtml(String html) {
        if (isBlank(html)) {
            return "";
        }
        String regEx = "<.+?>";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(html);
        String s = m.replaceAll("");
        return s;
    }

    /**
     * 缩略字符串（不区分中英文字符）
     *
     * @param str    目标字符串
     * @param length 截取长度
     * @return
     */
    public static String abbr(String str, int length) {
        if (str == null) {
            return "";
        }
        try {
            StringBuilder sb = new StringBuilder();
            int currentLength = 0;
            for (char c : str.toCharArray()) {
                currentLength += String.valueOf(c).getBytes("GBK").length;
                if (currentLength <= length - 3) {
                    sb.append(c);
                } else {
                    sb.append("...");
                    break;
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 转换为Double类型
     */
    public static Double toDouble(Object val) {
        if (val == null) {
            return 0D;
        }
        try {
            return Double.valueOf(trim(val.toString()));
        } catch (Exception e) {
            return 0D;
        }
    }

    /**
     * 转换为Float类型
     */
    public static Float toFloat(Object val) {
        return toDouble(val).floatValue();
    }

    /**
     * 转换为Long类型
     */
    public static Long toLong(Object val) {
        return toDouble(val).longValue();
    }

    /**
     * 转换为Integer类型
     */
    public static Integer toInteger(Object val) {
        return toLong(val).intValue();
    }

    /**
     * 获得i18n字符串
     */
    public static String getMessage(String code, Object[] args) {
        LocaleResolver localLocaleResolver = (LocaleResolver) com.gmk.framework.common.utils.SpringContextHolder.getBean(LocaleResolver.class);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Locale localLocale = localLocaleResolver.resolveLocale(request);
        return com.gmk.framework.common.utils.SpringContextHolder.getApplicationContext().getMessage(code, args, localLocale);
    }

    /**
     * 获得用户远程地址
     */
    public static String getRemoteAddr(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("X-Forwarded-For");
        } else if (isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("Proxy-Client-IP");
        } else if (isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
    }

    /**
     * 转化html转义字符
     *
     * @param str
     * @return
     */
    public static String transformEscapeCharacter(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");

        return str;
    }

    /**
     * 首字母小写
     *
     * @param param
     * @return
     */
    public static String toLowerCaseFirstLetter(String param) {
        if (StringUtils.isNotBlank(param)) {
            char[] chars = new char[1];
            chars[0] = param.charAt(0);
            String firstLetter = new String(chars);
            return param.replaceFirst(firstLetter, firstLetter.toLowerCase());
        }
        return param;
    }

    /**
     * 根据全包名获取类名
     * 例如com.gmk.framework.Customer得出Customer
     *
     * @param packageName
     * @return
     */
    public static String getGenericName(String packageName) {
        if (StringUtils.isNotBlank(packageName)) {
            int lastIndex = -1;
            if ((lastIndex = packageName.lastIndexOf(".")) != -1) {
                return packageName.substring(lastIndex + 1);
            } else {
                return packageName;
            }
        }

        return null;
    }

    /**
     * 对密码进行正则表达式校验和长度校验
     *
     * @param password
     * @return true 不是弱密码
     */
    public static boolean validatePassword(String password) {
//        Pattern pattern = Pattern.compile("^(?=^.{6,30}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z])[a-zA-Z0-9]*$");
//        Matcher matcher = pattern.matcher(passwd);
//        boolean b = matcher.matches();
//        return b;
        Pattern pattern = Pattern.compile("^[0-9a-zA-Z]{6,30}$");
        Pattern pattern_num = Pattern.compile("[0-9]{1,}");
        Pattern pattern_chara = Pattern.compile("[a-zA-Z]{1,}");
        Matcher matcher = pattern.matcher(password);
        Matcher matcher_num = pattern_num.matcher(password);
        Matcher matcher_chara = pattern_chara.matcher(password);

        if (matcher.matches() && matcher_num.find() && matcher_chara.find()) {
            return true;
        }
        return false;
    }

    /**
     * 判断某个字符串是否存在于数组中
     *
     * @param stringArray 原数组
     * @param source      查找的字符串
     * @return 是否找到
     */
    public static boolean contains(String[] stringArray, String source) {
        // 转换为list
        List<String> tempList = Arrays.asList(stringArray);

        // 利用list的包含方法,进行判断
        if (tempList.contains(source)) {
            return true;
        } else {
            return false;
        }
    }
}