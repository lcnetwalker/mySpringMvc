package com.springstudy.baseic_knowledge.adaptermode.objectadapter;

/**
 * Created by xgjt on 15/9/18.
 */
public class Wrapper implements Targetable {

    private Source source;


    public Wrapper(Source source) {
//        super();
        this.source = source;
    }

    @Override
    public void method1() {
        source.method1();
    }

    @Override
    public void method2() {
        System.out.println("这是目标方法");
    }
}
