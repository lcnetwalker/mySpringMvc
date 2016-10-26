package com.springstudy.service.basic.string;


import com.alibaba.druid.sql.visitor.functions.Trim;
import com.fasterxml.jackson.databind.util.BeanUtil;
import com.springstudy.service.spring.SpringContextHolder;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串处理类
 * @author Administrator
 *
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils{

	/**
	 * 判断字符串是否是null或者""
	 * @param src
	 * @return
	 */
	public static boolean isBlank(String src){
		if (null==src || "".equals(src.trim())) {
			return true;
		}
		return false;
	}
	
	/**
	 * 把没有实例化的串转化为空串 
	 * @param src
	 * @return
	 */
	public static String convertNull(String src){
		if (null==src) {
			return "";
		}else{
			return src;
		}
	}
	/**判断String是否为数字格式
	public static boolean isNumberString(String src){
		return isNumberString(src,"0123456789");
	}
	
	/**
	 * 全数字判断,参照字符串strRef可以是:"0123456789","23546"或"0123"等等。
	 * @param strIn
	 * @param strRef
	 * @return
	 */
	public static boolean isNumberString(String strIn, String strRef) {
	    if(strIn == null || strIn.length() == 0)
	      return(false);
	    for(int i = 0; i < strIn.length(); i++) {
	      String strTmp = strIn.substring(i, i + 1);
	      if(strRef.indexOf(strTmp, 0) == -1)
	        return(false);
	    }
	    return(true);
	  }


	/**
	 * 获取流水号
	 * @param prev 前缀字符串
	 * @param maxserial 数据库中最大流水号
	 * @param num 可变流水号位数(不包含前缀)
	 * @return
	 * @throws Exception 
	 */
	public  static String getSerialNumber(String prev,int maxserial,int num) throws Exception{
		String str="";
		//读取数据库里最大的流水号
		++maxserial;
		String s = maxserial+"";
		int length = s.length();
		if (length<num) {
			int differ = num-length;
			String zeros="";
			for (int i = 0; i < differ; i++) {
				zeros=zeros+"0";
			}
			str=zeros+maxserial;
		}else {
			throw new Exception("超出流水号限定长度！");
		}
		return prev+str;
	}



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

		LocaleResolver localLocaleResolver = (LocaleResolver) SpringContextHolder.getBean(LocaleResolver.class);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Locale localLocale = localLocaleResolver.resolveLocale(request);
		return SpringContextHolder.getApplicationContext().getMessage(code, args, localLocale);
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

	//验证字符串是否为数字格式
//	1用JAVA自带的函数
	public static boolean isNumeric_o(String str){
		for (int i = str.length();--i>=0;){
			if (!Character.isDigit(str.charAt(i))){
				return false;
			}
		}
		return true;
	}

//	2用正则表达式
	public static boolean isNumeric_z(String str){
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}

//	3用ascii码

	public static boolean isNumeric_a(String str){
		for(int i=str.length();--i>=0;){
			int chr=str.charAt(i);
			if(chr<48 || chr>57)
				return false;
		}
		return true;
	}

	/**
	 * 去掉所有的空格
	 * @return
	 */
	public static String TrimAll(String str){
		String trim = str.trim();
		String result = trim.replace(" ", "");
		return result;
	}

	/**
	 * 去掉相邻重复的字符 变为1个
	 * @param str
	 * @return
	 */
	public static String removeDuplicate(String str){
		str = str.replaceAll("(.)\\1+","$1");
		return str;
	}

	/**
	 * 获取PaodingRose的sql  添加的语句样式
	 * @param str  like "inplace,bz,hkyt,buycode,summoney,ljsum"
	 * @return
	 */
	public static String getInsertSQL(String str){
		StringBuilder sb_add=new StringBuilder();
		String[] split = str.split(",");
		for (String s:split){
			sb_add.append(",:1."+s);
		}
		return  sb_add.toString();
	}

	/**
	 * 获取PaodingRose的sql  更新的语句样式
	 * @param str  like "inplace,bz,hkyt,buycode,summoney,ljsum"
	 * @return
	 */
	public static String getUpdateSQL(String str){
		StringBuilder sb_update=new StringBuilder();
		String[] split = str.split(",");
		for (String s:split){
			sb_update.append(","+s+"=:1."+s);
		}
		return  sb_update.toString();
	}


	/**
	 * 获取两个时间的差
	 * @param endtm		:00 :30	结束的时间
	 * @param starttm	:00 :30 结束的时间
	 * @return
	 */
	public static String getTimeCha(String endtm,String starttm){
		if (com.gmk.framework.common.utils.StringUtils.isNotBlank(endtm)&&com.gmk.framework.common.utils.StringUtils.isNotBlank(starttm)){
			String[] s_end = endtm.split(":");
			String[] s_start = starttm.split(":");

			double v_int = Double.valueOf(s_end[0]) - Double.valueOf(s_start[0]);	//整数部分
			double v_s = Double.valueOf(s_end[1]) - Double.valueOf(s_start[1]);	//小数部分
			double result=0.00;

			if (v_s>0){
				result=v_int+0.5;
			}else if(v_s==0){
				result=v_int;
			}else if(v_s<0){
				result=v_int-0.5;
			}

			return  String.valueOf(result);
		}
		return  null;
	}

	public static void main(String[] args) {



		//去掉相邻的重复的字符
		String str="aaabbcccdddd11eeee测测试";
		String s1 = removeDuplicate(str);
//		System.out.println(s1);

		//替换文本中的$
		str="aaaa$codeg_className$bbbb";
		str = str.replaceAll("\\$codeg_className\\$", "MM");
//		System.out.println(str);



		String str1 = "2";
		String str2 = "10000";
		double a=12312.123;
		double b=12311.123;
		int compare = Double.compare(a, b);
//
//		System.out.println(compare);



		//工作过程中的数据库 字段 添加
		//String sql_fields="a,b,c,d";
		String sql_fields=",m_ordertype,m_order,m_money_now,m_money_ret";

		String insertSQL = getInsertSQL(sql_fields);
		String updateSQL = getUpdateSQL(sql_fields);

		System.out.println("insert: "+insertSQL);
		System.out.println("update: "+updateSQL);


		Double dbl=429999.2342;
		byte b1 = dbl.byteValue();
		System.out.println(b1);

	}




}
