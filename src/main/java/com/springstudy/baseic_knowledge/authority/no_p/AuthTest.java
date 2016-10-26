package com.springstudy.baseic_knowledge.authority.no_p;

/**
 * Created by xgjt on 15/8/20.
 */
public class AuthTest {
    public static void main(String[] args) {
        //可以访问同包下的 没有修饰符的类
        NoAuthJava naj=new NoAuthJava();
        //可以访问同目录下无修饰符的方法
        naj.bite();
        naj.PublicJava_protected();

    }
}
