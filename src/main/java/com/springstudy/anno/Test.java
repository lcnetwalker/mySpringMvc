package com.springstudy.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by xgjt on 15/7/4.
 */
public class Test {
    @Autowired
    private Boss boss;
    public static void main(String[] args) {

        //启动容器
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:com/springstudy/helloworld.xml");

        //关闭容器
        ((ClassPathXmlApplicationContext)ctx).destroy();;




    }
}
