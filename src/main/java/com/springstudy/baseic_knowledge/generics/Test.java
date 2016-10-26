package com.springstudy.baseic_knowledge.generics;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by xgjt on 15/9/17.
 */
public class Test {


    public void noc(){
        System.out.println("nnn");
    }


    public void sps(Object str){
        System.out.println(str);
    }

    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Test test = new Test();
        Method noc = test.getClass().getMethod("noc");
        noc.invoke(test);
        Method sps = test.getClass().getMethod("sps", Object.class);
        sps.invoke(test,"asdf");
    }
}
