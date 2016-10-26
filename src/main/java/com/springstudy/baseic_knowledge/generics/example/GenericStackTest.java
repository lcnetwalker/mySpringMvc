package com.springstudy.baseic_knowledge.generics.example;

/**
 * Created by xgjt on 15/11/27.
 */
public class GenericStackTest {
    public static void main(String[] args) {
        GenericStack<String> stack = new GenericStack<String>();

        System.out.println("Now add some words into stack!");

        stack.push("信息");
        System.out.println("信息 插入了stack");
        stack.push("信息1");
        System.out.println("信息1 插入了stack");

        while (!stack.isEmptdy()){
            String pop = stack.pop();
            System.out.println("Word:"+pop+" has been take out");
        }
    }
}
