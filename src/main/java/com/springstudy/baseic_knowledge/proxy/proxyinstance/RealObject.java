package com.springstudy.baseic_knowledge.proxy.proxyinstance;

/**
 * Created by xgjt on 15/9/6.
 */
public class RealObject implements Interface {

    @Override
    public void doSomething() {
        System.out.println("doSomething");
    }

    @Override
    public void somethingElse(String arg) {
        System.out.println("somethingElse "+arg);
    }
}
