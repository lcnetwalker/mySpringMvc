package com.springstudy.baseic_knowledge.adaptermode.classadapter;

/**
 * Created by xgjt on 15/9/18.
 */
public class Adapter extends Source implements Targetable {

    @Override
    public void method2() {
        System.out.println("这是目标方法");
    }

}
