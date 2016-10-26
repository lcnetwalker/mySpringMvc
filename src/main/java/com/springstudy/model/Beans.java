package com.springstudy.model;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by xgjt on 15/7/2.
 */

//1.表示一个配置信息提供类
@Configuration
public class Beans {

    //2.定义一个Bean
    @Bean(name="car")
    public Car0 buildCar(){
        Car0 car = new Car0();
        car.setBrand("红旗");
        car.setColor("红色");
        car.setMaxSpeed(200);
        return  car;
    }
}
