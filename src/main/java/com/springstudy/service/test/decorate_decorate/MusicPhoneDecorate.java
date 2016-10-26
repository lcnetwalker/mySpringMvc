package com.springstudy.service.test.decorate_decorate;

/**
 * Created by xgjt on 15/8/11.
 */
public class MusicPhoneDecorate extends PhoneDecorate {

    public MusicPhoneDecorate(Phone phone) {
        super(phone);
    }

    @Override
    public void Call() {
        super.Call();
        System.out.println("手机可以听音乐了");
    }
}
