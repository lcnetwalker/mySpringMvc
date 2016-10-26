package com.springstudy.baseic_knowledge.interface_example;

/**
 * Created by xgjt on 15/9/14.
 */
public class Test {
    public static void main(String[] args) {
        Car rcar = new RaceCar();
        rcar.start();

        RaceCar rcar1 = (RaceCar) rcar;


        Car tcar = new TravleCar();
        tcar.start();
    }
}
