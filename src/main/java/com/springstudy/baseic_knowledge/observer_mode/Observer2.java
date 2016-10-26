package com.springstudy.baseic_knowledge.observer_mode;

/**
 * Created by xgjt on 15/9/24.
 */
public class Observer2 implements Observer {

    @Override
    public void update() {
        System.out.println("observer2 has received!");
    }
}
