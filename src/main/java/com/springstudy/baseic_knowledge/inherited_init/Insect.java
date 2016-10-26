package com.springstudy.baseic_knowledge.inherited_init;

/**
 * Created by xgjt on 15/8/21.
 */
public class Insect {
    private int i=9;
    protected int j;

    Insect(){
        System.out.print("i = " + i + ", j = " + j);
        j=39;
    }

    private static int x1=printInit("static Insect.x1 initalized");

    static int printInit(String s){
        System.out.println("_" + s);
        return 47;
    }
}
