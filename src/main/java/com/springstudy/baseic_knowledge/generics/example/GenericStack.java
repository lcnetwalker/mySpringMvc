package com.springstudy.baseic_knowledge.generics.example;

import org.apache.poi.ss.formula.functions.T;

import java.util.LinkedList;

/**
 * Created by xgjt on 15/11/27.
 */
public class GenericStack<T> {
    private LinkedList<T> list = new LinkedList<T>();

    public void push(T t){
        list.addFirst(t);
    }

    public T pop(){
        T first = list.removeFirst();
        return first;
    }

    public boolean isEmptdy(){
        return list.isEmpty();
    }
}
