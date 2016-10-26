package com.springstudy.attr;

import com.springstudy.model.Car0;

/**
 * Created by xgjt on 15/7/3.
 */
public class Boss {
    private Car0 car;
    //设置car属性
    public void  setCar(Car0 car){
        this.car=car;
    }
    public String getCar(){
        return  this.car.getBrand()+" "+this.car.getMaxSpeed()+" "+this.car.getPrice();
    }
}
