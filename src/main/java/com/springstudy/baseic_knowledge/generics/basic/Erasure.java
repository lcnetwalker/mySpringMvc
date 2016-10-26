package com.springstudy.baseic_knowledge.generics.basic;


import java.util.*;

/**
 * Created by xgjt on 15/9/17.
 */
public class Erasure {
    public static void main(String[] args) {
        List<String>l1 = new ArrayList<String>();
        List<Integer>l2 = new ArrayList<Integer>();
        System.out.println(l1.getClass() == l2.getClass()); //True
    }
}
