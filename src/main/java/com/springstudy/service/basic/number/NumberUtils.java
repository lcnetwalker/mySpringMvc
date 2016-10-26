package com.springstudy.service.basic.number;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * Created by xgjt on 16/1/21.
 */
public class NumberUtils {

    /**
     * 数组转换成字符串
     * @param str
     * @return
     */
    public static  String  getArraytoString(String [] str){
        if (str==null){
            return "";
        }
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < str.length; i++){
            sb. append(str[i]);
        }
        return  sb.toString();
    }


    /**
     * 名称：strcountinstring
     * 功能：计算一个字符在一个字符串中出现的次数
     * 参数：a，源字符串；
     * b，需要查找的字符串；
     * 返回：findcount，统计次数
     * @param a
     * @param b
     * @return
     */
    public static int getSubNum(String a,String b){
        int num=0;
        String str=a;
        int index=a.indexOf(b);
        while(index!=-1){
            num++;
            str=str.substring(index+b.length()-1);
            index=str.indexOf(b);
        }
        return num;
    }



    /**
     * 判断字符串是否是整数
     */
    public static boolean isInteger(String value) {
        try {
            Integer.parseInt(value);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * 判断字符串是否是浮点数
     */
    public static boolean isDouble(String value) {
        try {
            Double.parseDouble(value);
            if (value.contains("."))
                return true;
            return false;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * 判断字符串是否是数字
     */
    public static boolean isNumber(String value) {
        Pattern pattern = Pattern.compile("[0-9]*");
        return pattern.matcher(value).matches();
    }

    /**
     * 判断字符串是否是数字 含小数
     */
    public static boolean isNumber1(String value) {
        Pattern pattern = Pattern.compile("\\d+\\.?\\d*");
        return pattern.matcher(value).matches();
    }

    /**
     * 保留2位小数  后面的四舍五入
     * @param d
     * @param size
     * @return
     */
    public static double getDecimal_Size(double d,int size){

        BigDecimal b = new BigDecimal(d);

        double f1 = b.setScale(size, BigDecimal.ROUND_HALF_UP).doubleValue();

        return f1;

    }


    public static void main(String[] args) {
        double decimal_size = getDecimal_Size(2222.00, 2);
        System.out.println(decimal_size);
    }

}
