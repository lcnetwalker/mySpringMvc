package com.springstudy.baseic_knowledge.proxy.proxyinstance;

/**
 * Created by xgjt on 15/9/6.
 */
public class SimpleProxy implements Interface {

    private Interface proxied;

    public SimpleProxy(Interface proxied){
        this.proxied=proxied;
    }
    @Override
    public void doSomething() {
        System.out.println("SimpleProxy doSomething");
        proxied.doSomething();
    }

    @Override
    public void somethingElse(String arg) {
        System.out.println("SimpleProxy somethingElse "+arg);
        proxied.somethingElse(arg);
    }
}
