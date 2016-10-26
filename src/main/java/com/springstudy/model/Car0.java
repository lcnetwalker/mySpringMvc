package com.springstudy.model;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.*;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by xgjt on 15/6/25.
 */


public class Car0 {

    private String brand;
    private String color;
    private int maxSpeed;
    private double price;


    public Car0(){
        System.out.println("调用Car()构造函数。");
    };
    public Car0(String brand, String color, int maxSpeed){
        this.brand=brand;
        this.color=color;
        this.maxSpeed=maxSpeed;
    };

    public String getBrand() {
        return brand;
    }

    @PostConstruct
    public void setBrand(String brand) {
        System.out.println("调用setBrand()设置属性。");
        this.brand = brand;
    }


    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
