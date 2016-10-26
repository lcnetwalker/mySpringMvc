package com.springstudy.model;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.*;

/**
 * Created by xgjt on 15/6/25.
 */
//1、管理Bean生命周期的接口
public class Car implements BeanFactoryAware,BeanNameAware,InitializingBean,
        DisposableBean{

    private String brand;
    private String color;
    private int maxSpeed;
    private double price;

    private  BeanFactory beanFactory;
    private  String beanName;

    public Car(){
        System.out.println("调用Car()构造函数。");
    };
    public Car(String brand, String color, int maxSpeed){
        this.brand=brand;
        this.color=color;
        this.maxSpeed=maxSpeed;
    };

    public Car(String brand, String color, double price){
        this.brand=brand;
        this.color=color;
        this.price=price;
    };


    public void introduce(){
        System.out.println("brand:"+brand+";color:"+color+";maxSpeed:"+maxSpeed);
    }

    public String getBrand() {
        return brand;
    }

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

    //2、BeanFactoryAware接口方法
    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        System.out.println("调用BeanFactoryAware.setBeanFactory().");
        this.beanFactory=beanFactory;
    }

    //3、BeanNameAware接口方法
    @Override
    public void setBeanName(String s) {
        System.out.println("调用BeanNameAware.setBeanName()。");
    }

    //4、InitializingBean接口方法
    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("调用InitializingBean.afterPropertiesSet()。");
    }

    //5、DisposableBean 接口方法
    @Override
    public void destroy() throws Exception {
        System.out.println("调用DisposableBean.destroy()。");
    }

    //6、通过<bean>的init-method属性指定的初始化方法
    public void myInit(){
        System.out.println("调用init-method属性指定的myInit(),将maxSpeed设置为240。");
        this.maxSpeed=240;
    }

    //7、通过<bean>的destroy-method属性指定的初始化方法
    public void myDestroy(){
        System.out.println("调用destroy-method属性指定的myDestroy()。");
    }


    public String toString(){
        return  this.getBrand()+" "+this.getColor()+" "+this.getPrice();
    }
}
