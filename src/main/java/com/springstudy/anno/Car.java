package com.springstudy.anno;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by xgjt on 15/7/4.
 */
@Scope("prototype")
@Component
public class Car {
    private String brand;
    private int price;
    private int maxspeed;


    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        System.out.println("execute in setBrand");
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getMaxspeed() {
        return maxspeed;
    }

    public void setMaxspeed(int maxspeed) {
        this.maxspeed = maxspeed;
    }
}
