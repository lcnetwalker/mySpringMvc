package com.springstudy.baseic_knowledge.generics.basic.t_collection;

import java.util.List;

/**
 * Created by xgjt on 15/9/17.
 */
public class Tmain {

    public void go(String str){
        System.out.println("normal function");
    }

    public <T> void got(T t){
        System.out.println("generic function");
    }


    public static void main(String[] args) {
        Tmain tmain = new Tmain();
        tmain.go("hhaa");

        tmain.<String>got("asdf");//打印generic function

        tmain.got(new Object());//打印generic function
        tmain.<Object>got(new Object());//打印generic function
    }
}
