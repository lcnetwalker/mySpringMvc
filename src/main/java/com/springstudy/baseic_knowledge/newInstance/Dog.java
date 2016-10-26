package com.springstudy.baseic_knowledge.newInstance;

/**
 * Created by xgjt on 15/8/28.
 */
public class Dog {
    private String color;

//    构造方法要与类名相同，无返回类型（void也不能有），在类初始化的时候调用。
    Dog(){
        System.out.println("a Dog");
    }
    void Dog(){
        System.out.println("void Dog");
    }
    public void call(){
        System.out.println("i'm a dog");
    }
}
