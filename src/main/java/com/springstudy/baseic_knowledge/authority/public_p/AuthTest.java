package com.springstudy.baseic_knowledge.authority.public_p;

/**
 * Created by xgjt on 15/8/20.
 */
public class AuthTest {
    public static void main(String[] args) {

        //可以访问public的类
        PublicJava publicJava = new PublicJava();
        //可以访问同包下的无修饰符的方法
        publicJava.bite();
    }
}
