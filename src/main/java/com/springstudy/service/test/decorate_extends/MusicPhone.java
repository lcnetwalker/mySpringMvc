package com.springstudy.service.test.decorate_extends;

/**
 * Created by xgjt on 15/8/11.
 */
public class MusicPhone extends Phone{
    @Override
    public void Call() {
        System.out.println("手机可以听音乐了");
        super.Call();
    }
}
