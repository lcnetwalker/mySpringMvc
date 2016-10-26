package com.springstudy.baseic_knowledge.polymorphic.upchange.interface_.completely_jieou;

/**
 * Created by xgjt on 15/8/24.
 */
public class Applay {
    public static void process(Processor p,Object s){
        System.out.println("Using Processor "+p.name());
        System.out.println(p.process(s));
    }
}
