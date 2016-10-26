package com.springstudy.baseic_knowledge.interface_example;

/**
 * Created by xgjt on 15/9/14.
 */
public class OtherCar {
    public static Car makeCar(){
        return new RaceCar();
    }

    public static void main(String[] args) {
        OtherCar otherCar=new OtherCar();
        Car car = otherCar.makeCar();
        RaceCar rc=(RaceCar)car;
        rc.Race();
    }
}
