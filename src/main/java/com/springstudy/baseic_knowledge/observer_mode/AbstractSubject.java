package com.springstudy.baseic_knowledge.observer_mode;

import java.util.Enumeration;
import java.util.Vector;

/**
 * Created by xgjt on 15/9/24.
 */
public class AbstractSubject implements Subject {

    private Vector<Observer> vector  =  new Vector<Observer>();

    @Override
    public void add(Observer observer) {
        vector.add(observer);
    }

    @Override
    public void remove(Observer observer) {
        vector.remove(observer);
    }

    @Override
    public void notifyObservers() {

        Enumeration<Observer> enumo = vector.elements();
        while(enumo.hasMoreElements()){
            enumo.nextElement().update();
        }
    }

    @Override
    public void operation() {
        System.out.println("update self!");
        notifyObservers();

    }
}