package com.springstudy.service.test.decorate_extends;

/**
 * Created by xgjt on 15/8/11.
 */
public class ColorPhone extends Phone {
    @Override
    public void Call() {
        System.out.println("手机可以播放彩铃了");
//        System.out.println("手机可以打电话");
        super.Call();
    }
}
