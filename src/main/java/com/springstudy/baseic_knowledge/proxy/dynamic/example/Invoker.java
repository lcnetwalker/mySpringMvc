package com.springstudy.baseic_knowledge.proxy.dynamic.example;

import net.paoding.rose.web.Invocation;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * 动态代理类，实现InvocationHandler接口
 * Created by xgjt on 15/9/10.
 */
public class Invoker implements InvocationHandler {
    AbstractClass ab;
    Object ac;      //任何类

    public Invoker(Object ac) {
        this.ac = ac;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args)
            throws Throwable {

        //调用之前 做一些处理
        System.out.println("前处理！");
        method.invoke(ac,args);
        method.invoke(ab,args);
        System.out.println("后处理！");
        return null;

    }
}
