package com.springstudy.baseic_knowledge.observer_mode;

/**
 * Created by xgjt on 15/9/24.
 */
public class Test {

    public static void main(String[] args) {
        AbstractSubject sub = new AbstractSubject();
        sub.add(new Observer1());
        sub.add(new Observer2());

        sub.operation();
    }



}
