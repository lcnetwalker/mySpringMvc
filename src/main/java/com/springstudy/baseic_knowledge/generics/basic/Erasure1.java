package com.springstudy.baseic_knowledge.generics.basic;

import java.util.Collection;

/**
 * Created by xgjt on 15/9/17.
 */
public class Erasure1 {
    //编译时候报错，因为有相同的擦除类型
//    public void test(List<String> ls){
//        System.out.println("String");
//    }
    public void test(List1<Integer> li){
        System.out.println("Integer");
    }


    void printClection(Collection<?> c){
        for(Object o:c){
            System.out.println(o);
        }
    }


}
