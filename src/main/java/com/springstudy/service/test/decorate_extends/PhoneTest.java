package com.springstudy.service.test.decorate_extends;

/**
 * Created by xgjt on 15/8/11.
 */
public class PhoneTest {
    public static void main(String[] args) {
        Phone phone = new Phone();
        phone.Call();

        System.out.println("-----------------------------------");

        phone = new ColorPhone(); //多态
        phone.Call();

        System.out.println("-----------------------------------");

        phone = new MusicColorPhone();
        phone.Call();

        System.out.println("-----------------------------------");

        phone = new MusicPhone();
        phone.Call();
    }
}
