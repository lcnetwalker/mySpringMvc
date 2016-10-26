package com.springstudy.baseic_knowledge.inherited_init;

/**
 * Created by xgjt on 15/8/21.
 */
public class Beetle extends Insect {

    private  int k=printInit("Beetle.k.initalized");
    public  Beetle(){
        System.out.println("k = "+k);
        System.out.println("j = "+j);
    }

    private static int x2=printInit("static Beetle.x2.initialized");

    public static void main(String[] args) {
        System.out.println("Beetle constructor");
        Beetle b=new Beetle();
    }
}
