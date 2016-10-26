package com.springstudy.service.test.singleton;

/**
 * Created by xgjt on 15/8/11.
 */
public class Student {
    //为了不让外借访问，构造方法私有化
    private Student(){

    }

    //同一个包才能访问这个类变量
    static  String str="abc";

    //创建一个对象
    //为了让静态方法访问，则需要加个静态修饰符
    //被private了  同包也不能访问

    //类加载就生成该对象
    private static Student  student = new Student();

    public static Student getStudent(){
        return  student;
    }

    public void show(){
        System.out.println("单例！");
    }
}
