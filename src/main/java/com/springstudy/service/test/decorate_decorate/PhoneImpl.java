package com.springstudy.service.test.decorate_decorate;

/**
 * Created by xgjt on 15/8/11.
 */
public class PhoneImpl implements Phone {
    @Override
    public void Call() {
        System.out.println("手机可以打电话");
    }
}
