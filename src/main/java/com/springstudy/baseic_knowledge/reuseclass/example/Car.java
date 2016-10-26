package com.springstudy.baseic_knowledge.reuseclass.example;

/**
 * Created by xgjt on 15/8/20.
 */
public class Car {
    public Engine engine=new Engine();
    public Wheel[] wheels=new Wheel[4];

    public Door
        left=new Door(),
        right=new Door();

    public Car(){
     for (int i=0;i<4;i++){
         wheels[i]=new Wheel();
     }
    }
    public static void main(String[] args){
        Car car=new Car();
        car.left.window.rollup();
        car.wheels[0].inflate(72);
    }
}
