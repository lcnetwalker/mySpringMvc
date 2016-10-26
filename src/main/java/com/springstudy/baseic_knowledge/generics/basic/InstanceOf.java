package com.springstudy.baseic_knowledge.generics.basic;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by xgjt on 15/9/17.
 */
public class InstanceOf {

    public static void main(String[] args) {

        Collection<String> strings = new ArrayList<String>();
        // compile error.如果改成instanceof Collection<?>则不会出错。
//        if(strings instanceof Collection<String>){
        if(strings instanceof Collection<?>){

        }
    }
}
