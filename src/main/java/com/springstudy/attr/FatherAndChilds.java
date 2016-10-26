package com.springstudy.attr;

import com.springstudy.model.Car0;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by xgjt on 15/7/3.
 */
public class FatherAndChilds {
    public static void main(String[] args){

        ClassPathXmlApplicationContext pfct = new ClassPathXmlApplicationContext(
                new String[]{"com/springstudy/beans1.xml"});

        ClassPathXmlApplicationContext fct = new ClassPathXmlApplicationContext(
                new String[]{"com/springstudy/beans2.xml"}, pfct);

        Car0 child = (Car0)fct.getBean("car");
        Boss boss = (Boss)fct.getBean("boss");

        System.out.println(child.getBrand()+" "+child.getMaxSpeed()+" "+child.getPrice());
        System.out.println(boss.getCar().toString());
    }
}
