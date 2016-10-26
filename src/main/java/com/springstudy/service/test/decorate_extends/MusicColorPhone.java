package com.springstudy.service.test.decorate_extends;

/**
 * Created by xgjt on 15/8/11.
 */
public class MusicColorPhone extends ColorPhone{
    @Override
    public void Call() {
        super.Call();
        System.out.println("手机可以听音乐了");
    }
}
