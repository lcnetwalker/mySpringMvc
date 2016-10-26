package com.springstudy.service.test.decorate_decorate;

/**
 * Created by xgjt on 15/8/11.
 */
public class PhoneTest {
    public static void main(String[] args) {
        //最基本的手机类
        Phone p=new PhoneImpl();
        p.Call();

        System.out.println("-------------------------------------------");
        //装饰手机播放彩铃
        PhoneDecorate pd = new ColorPhoneDecorate(p);
        pd.Call();

        System.out.println("-------------------------------------------");
        //装饰手机播放彩铃
        pd = new MusicPhoneDecorate(p);
        pd.Call();

        System.out.println("-------------------------------------------");
        //装饰手机 既可以播放彩铃  还可以播放音乐
        pd=new MusicPhoneDecorate(new ColorPhoneDecorate(p));
        pd.Call();
    }
}
