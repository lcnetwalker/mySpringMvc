package com.springstudy.baseic_knowledge.adaptermode.abstractadapter;

/**
 * Created by xgjt on 15/9/18.
 */
public class SourceSub1 extends Wrapper2 {
    @Override
    public void method1() {
        super.method1();
        System.out.println("这是继承了实现类后的方法1");
    }
}
