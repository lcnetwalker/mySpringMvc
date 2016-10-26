package com.springstudy.baseic_knowledge.generics.basic;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xgjt on 15/9/17.
 */
public class Arrayss {
    public static void main(String[] args) throws NoSuchMethodException {
        List<?>[] lsa = new List<?>[10]; // ok, array of unbounded wildcard type

        Object o = lsa;
        Object[] oa = (Object[]) o;
        List<Integer>li = new ArrayList<Integer>();
        li.add(new Integer(3));

        oa[1] = li; //correct
        String s = (String) lsa[1].get(0);// run time error, but cast is explicit
        Integer it = (Integer)lsa[1].get(0); // OK

    }
}
