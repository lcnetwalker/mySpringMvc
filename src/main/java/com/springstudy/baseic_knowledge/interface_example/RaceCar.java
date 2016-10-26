package com.springstudy.baseic_knowledge.interface_example;

/**
 * Created by xgjt on 15/9/14.
 */
public class RaceCar implements Car{
    @Override
    public void start() {
        System.out.println("Race car start!");
    }

    @Override
    public void run() {
        System.out.println("Race car run!");
    }

    @Override
    public void stop() {
        System.out.println("Race car stop!");
    }

    public void Race(){
        System.out.println("比赛中加速");
    }
}
