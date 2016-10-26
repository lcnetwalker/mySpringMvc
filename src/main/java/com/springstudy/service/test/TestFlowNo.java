package com.springstudy.service.test;

/**
 * Created by xgjt on 15/9/5.
 */
public class TestFlowNo {
    public static void main(String[] args) {
//        String s = AddOne("0", 6);
//        System.out.println(s);

        String str="012345678901";
        String substring = str.substring(8);
        System.out.println(substring);
    }



    private static String AddOne(String num, int length) {

        String newNum = String.valueOf(Long.parseLong(num) + 1);
        int len = length - newNum.length();
        for(int i = 0; i < len; i++) {
            newNum = "0" + newNum;
        }
        return newNum;
    }
}
