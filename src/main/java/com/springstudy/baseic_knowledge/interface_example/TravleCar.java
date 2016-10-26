package com.springstudy.baseic_knowledge.interface_example;

/**
 * Created by xgjt on 15/9/14.
 */
public class TravleCar implements Car {
    @Override
    public void start() {
        System.out.println("TravleCar start");
    }

    @Override
    public void run() {
        System.out.println("TravleCar run");
    }

    @Override
    public void stop() {
        System.out.println("TravleCar stop");
    }

    public  void travle(){
        System.out.println("旅游观光！");
    }
}
