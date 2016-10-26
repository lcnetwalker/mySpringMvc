package com.springstudy.baseic_knowledge.generics.stackclass;

import java.lang.reflect.Method;
import java.lang.reflect.Type;

/**
 * Created by xgjt on 15/9/15.
 */
public class LinkedStack1<T> {
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

    private Node<T> top=new Node<T>();


    public void push(T item){
        top=new Node<T>(item,top);
    }

    public T pop(){
        T result = top.item;
        if (!top.end())
            top=top.next;
        return result;
    }

    public static void main(String[] args) throws NoSuchMethodException {
        LinkedStack1<String> lss = new LinkedStack1<String>();
        for (String s:"Phasers on stun!".split(" "))
            lss.push(s);
        String s;
        while ((s=lss.pop())!=null)
            System.out.println(s);
        System.out.println(lss.toString());


        Method main = LinkedStack1.class.getMethod("main", String[].class);
        Type[] genericParameterTypes = main.getGenericParameterTypes();
        Type genericParameterType = genericParameterTypes[0];

        System.out.println(genericParameterType);

    }
}
