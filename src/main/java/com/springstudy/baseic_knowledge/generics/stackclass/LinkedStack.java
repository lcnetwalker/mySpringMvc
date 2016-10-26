package com.springstudy.baseic_knowledge.generics.stackclass;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * Created by xgjt on 15/9/15.
 */
public class LinkedStack<String> {
    private static class Node<U>{
        U item;
        Node<U> next;
        Node(){item=null;next=null;}
        Node(U item,Node<U> next){
            this.item=item;
            this.next=next;
        }
        boolean end(){
            return item==null&& next==null;
        }
    }

    private Node<String> top=new Node<String>();


    public void push(String item){
        top=new Node<String>(item,top);
    }

    public String pop(){
        String result = top.item;
        if (!top.end())
            top=top.next;
        return result;
    }

    public static void main(java.lang.String[] args) throws NoSuchMethodException {
        LinkedStack1<java.lang.String> lss = new LinkedStack1<java.lang.String>();
        for (java.lang.String s:"Phasers on stun!".split(" "))
            lss.push(s);
        java.lang.String s;
        while ((s=lss.pop())!=null)
            System.out.println(s);
        System.out.println(lss.toString());

    }
}
