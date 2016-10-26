package com.springstudy.baseic_knowledge.authority;

import com.springstudy.baseic_knowledge.authority.public_p.PublicJava;

/**
 * Created by xgjt on 15/8/20.
 */
public class AuthTest {
    public static void main(String[] args) {
        //不能访问子目录的没有修饰符的类


        //可以访问Public的类
        PublicJava publicJava = new PublicJava();
        //不能访问其他目录的无修饰符的方法
    }
}
