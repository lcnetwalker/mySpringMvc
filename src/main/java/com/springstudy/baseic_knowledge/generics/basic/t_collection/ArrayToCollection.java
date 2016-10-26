package com.springstudy.baseic_knowledge.generics.basic.t_collection;

import org.apache.poi.ss.formula.functions.T;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by xgjt on 15/9/17.
 */
public class ArrayToCollection {
    public void fromArrayToCollection(Object[] os,Collection<?> c){
        for(Object o:os){
            //因为集合c中的类型未知，所以不能往其中加入任何的对象（当然，null除外）
//            c.add(o);
        }
    }

    public static  <T> void fromArrayToCollection_t(T[] os,Collection<T> t){
        for (T o:os){
            t.add(o);
        }
    }

    public static void main(String[] args) {
        Object[] objects = new Object[100];
        Collection<Object> co = new ArrayList<>();
        fromArrayToCollection_t(objects,co);
        System.out.println(co);

        String[] strings = new String[100];
        Collection<String> cs = new ArrayList<String>();
        fromArrayToCollection_t(strings,cs);
        System.out.println(cs);

        Integer[] integers = new Integer[100];
        Collection<Object> ci = new ArrayList<>();
        fromArrayToCollection_t(integers,ci);
        System.out.println(ci);


        Float[] floats = new Float[100];
        Collection<Object> cf = new ArrayList<>();
        fromArrayToCollection_t(floats,cf);
        System.out.println(cf);

        Number[] numbers = new Number[100];
        Collection<Object> cn = new ArrayList<>();
        fromArrayToCollection_t(numbers,cn);
        System.out.println(cn);
    }
}
