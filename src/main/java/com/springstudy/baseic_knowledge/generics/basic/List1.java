package com.springstudy.baseic_knowledge.generics.basic;

import java.util.Iterator;

/**
 * Created by xgjt on 15/9/17.
 */
public interface List1<E> {
    void add(E x);
    Iterator<E> iterator();
}
