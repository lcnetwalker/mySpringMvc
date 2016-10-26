package com.springstudy.service.example;

import com.springstudy.model.Beans;
import com.springstudy.model.Car0;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by xgjt on 15/7/2.
 */
public class AnnotationApplicationContext {


    public static  void main(String[] args){

        //通过一个带@Configration的POJO装载Bean配置
        AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(Beans.class);
        Car0 car = ctx.getBean("car", Car0.class);
        String brand = car.getBrand();
        System.out.print(brand);

    }
}
