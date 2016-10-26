package com.springstudy.baseic_knowledge.polymorphic.upchange.interface_.completely_jieou;

/**
 * Created by xgjt on 15/8/24.
 */
public abstract class StringProcessor implements Processor {

    @Override
    public String name() {
        return getClass().getSimpleName();
    }

    public abstract Object process(Object input);

    public static String s="If she weighs the same as a duck,she's made of wood";

    public static void main(String[] args) {

    }
}
