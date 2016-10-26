package com.springstudy.baseic_knowledge.interface_example.example.interfaces;

/**
 * Created by xgjt on 15/9/15.
 */
public class B  implements A{
    @Override
    public void f() {
        System.out.println("B  f()");
    }
    public  void g(){
        System.out.println("B  g()");
    }
}
