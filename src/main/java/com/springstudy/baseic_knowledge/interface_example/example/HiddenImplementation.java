package com.springstudy.baseic_knowledge.interface_example.example;

import com.springstudy.baseic_knowledge.interface_example.example.interfaces.A;
import com.springstudy.baseic_knowledge.interface_example.example.packageaccess.HiddenC;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by xgjt on 15/9/15.
 */
public class HiddenImplementation {
    public static void main(String[] args) throws Exception {
        A a = HiddenC.makeA();
        a.f();

        System.out.println(a.getClass().getName());

//        if (a instanceof C){  //编译失败，因为C类限制符是包访问权限

//        }

        callHiddenMethod(a,"g");
        callHiddenMethod(a,"u");
        callHiddenMethod(a,"v");
        callHiddenMethod(a,"w");


    }



    static void callHiddenMethod(Object a , String methodName) throws Exception {
        try {
            Method g = a.getClass().getDeclaredMethod(methodName);
            g.setAccessible(true);
            g.invoke(a);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }
}
