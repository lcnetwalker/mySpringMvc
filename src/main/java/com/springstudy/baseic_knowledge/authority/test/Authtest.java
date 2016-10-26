package com.springstudy.baseic_knowledge.authority.test;

import com.springstudy.baseic_knowledge.authority.public_p.PublicJava;

/**
 * Created by xgjt on 15/8/20.
 */
public class Authtest {
    public static void main(String[] args) {
        //不能访问 其他包的没有权限控制符的类 NoAuthJava


        //可以访问public的类
        PublicJava publicJava = new PublicJava();

    }
}
