package com.springstudy.baseic_knowledge.proxy.dynamic.example;

/**
 * 具体类B
 * Created by xgjt on 15/9/10.
 */
public class ClassB implements AbstractClass {
    @Override
    public void show() {
        System.out.println("我是B类");
    }
}
