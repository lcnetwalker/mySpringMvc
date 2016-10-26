package com.springstudy.baseic_knowledge.authority.public_p.subpackage;

import com.springstudy.baseic_knowledge.authority.public_p.PublicJava;

/**
 * Created by xgjt on 15/8/20.
 */
public class AuthTest {
    public static void main(String[] args) {
        //可以访问public的类
        PublicJava publicJava = new PublicJava();
        //不能访问非同一目录下的无修饰符的方法
    }
}
