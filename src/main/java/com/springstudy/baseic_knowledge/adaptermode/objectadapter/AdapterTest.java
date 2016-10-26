package com.springstudy.baseic_knowledge.adaptermode.objectadapter;

/**
 * Created by xgjt on 15/9/18.
 */
public class AdapterTest {
    public static void main(String[] args) {

        //对象适配器模式
        Source source=new Source();
        Wrapper wrapper = new Wrapper(source);
        wrapper.method1();
        wrapper.method2();
    }
}
