package com.springstudy.baseic_knowledge.interface_example.example;

import com.springstudy.baseic_knowledge.interface_example.example.interfaces.A;
import com.springstudy.baseic_knowledge.interface_example.example.interfaces.B;

/**
 * Created by xgjt on 15/9/15.
 */
public class InterfaceViolation {
    public static void main(String[] args) {
        A  a = new B();
        a.f();
//        a.g();
        System.out.println(a.getClass().getName());
        if(a instanceof B){
            B b=(B)a;
            b.g();
        }
    }
}
