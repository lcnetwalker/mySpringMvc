package com.springstudy.baseic_knowledge.bridge_mode;

/**
 * Created by xgjt on 15/9/21.
 */
public class SourceSub1 implements Sourceable {
    @Override
    public void method() {
        System.out.println("这是第一个sub");
    }
}
