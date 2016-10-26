package com.springstudy.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/**
 * Created by xgjt on 15/7/4.
 */
@Component
public class Boss {
    private Car car;
    public Boss(){
        System.out.println("construct....");
    }

    @Autowired
    private void setCar(Car car){
        System.out.println("execute in setCar");
        this.car=car;
    }

    @PostConstruct
    private void  init1(){
        System.out.println("@PostConstruct: execute in int1");
    }

    @PostConstruct
    private void init2(){
        System.out.println("@PostConstruct: execute in int2");
    }


    @PreDestroy
    private void destroy1(){
        System.out.println("@PreDestroy:execute in destroy1");
    }

    @PreDestroy
    private void destroy2(){
        System.out.println("@PreDestroy:execute in destroy2");
    }


}
