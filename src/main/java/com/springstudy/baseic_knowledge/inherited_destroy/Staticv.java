package com.springstudy.baseic_knowledge.inherited_destroy;

/**
 * Created by xgjt on 15/8/21.
 */
public class Staticv {
    public static int i=0;
    public final int id=++i;
    public static void main(String[] args) {
        Staticv staticv = new Staticv();
        System.out.println(String.valueOf(staticv.id));
        Staticv staticv1 = new Staticv();
        System.out.println(String.valueOf(staticv1.id));
        Staticv staticv2 = new Staticv();
        System.out.println(String.valueOf(staticv2.id));

    }
}
