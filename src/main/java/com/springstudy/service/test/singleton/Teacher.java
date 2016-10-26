package com.springstudy.service.test.singleton;

/**
 * Created by xgjt on 15/8/11.
 */
public class Teacher {

    //构造私有
    private Teacher(){}

    //本类创建对象
    private  static Teacher  t=null;

    //提供功能的访问方式
    //synchronized 标示 解决线程安全性；被同步的代码，在某一时刻只能被一个线程访问。
    public synchronized static  Teacher getTeacher(){
        if (t==null){
            t=new Teacher();
        }
        return  t;
    }

    //方法
    public void love(){
        System.out.println("懒汉模式");
    }

}
