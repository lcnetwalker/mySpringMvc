package com.springstudy.baseic_knowledge.bridge_mode;

/**
 * Created by xgjt on 15/9/21.
 */
public class MyBridge extends Bridge {
    @Override
    public void method() {
        getSource().method();
    }
}
