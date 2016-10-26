package com.springstudy.baseic_knowledge.proxy.proxyinstance;

/**
 * Created by xgjt on 15/9/6.
 */
public class SimpleProxyDemo {

    public static void consumer(Interface iface){
        iface.doSomething();
        iface.somethingElse("bonobo");
    }
    public static void main(String[] args) {
//        consumer(new RealObject());
        System.out.println("\n");

       consumer(new SimpleProxy(new RealObject()));
    }
}
