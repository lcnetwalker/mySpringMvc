package com.springstudy.service.test.decorate_decorate;

/**
 * Created by xgjt on 15/8/11.
 */
public class ColorPhoneDecorate extends PhoneDecorate {

    public ColorPhoneDecorate(Phone phone) {
        super(phone);
    }

    @Override
    public void Call() {
        System.out.println("手机可以播放彩铃");
        super.Call();
    }
}
