package com.springstudy.baseic_knowledge.string_study;


import com.springstudy.service.basic.date.DateUtils;

import java.util.Date;

/**
 * Created by xgjt on 15/10/24.
 */
public class StringStudy {

    private static StringBuffer sb=new StringBuffer();

    public static void main(String[] args) {

        sb.append("tst");
        sb.insert(1,"AA");

        sb.replace(1,4,"C");
        System.out.println(sb);


    }
}
