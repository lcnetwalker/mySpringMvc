package com.springstudy.beanfactory;

import org.springframework.beans.BeansException;
import org.springframework.beans.PropertyValues;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessorAdapter;

import java.beans.PropertyDescriptor;

/**
 * Created by xgjt on 15/7/2.
 */
public class MyInstantiationAwareBeanPostProcessor extends InstantiationAwareBeanPostProcessorAdapter {

    //1、接口方法：在实例化Bean前进行调用
    public Object postProcessBeforeInstantiation(Class beanClass, String beanName) throws BeansException{
        //1.1、进队容器中car Bean进行处理
        if("car".equals(beanName)){
            System.out.println("InstantiationAware BeanPostProcessor.postProcessBeforeInstantiation");
        }
        return null;
    }

    //2、接口方法：在实例化Bean后调用
    public boolean postProcessAfterInstantiation(Object bean,String beanName) throws BeansException{
        //2.1、仅对容器中car Bean进行处理
        if ("car".equals(beanName)) {
            System.out.println("InstantiationAware BeanPostProcessor.postProcessAfterInstantiation");
        } else {
        }
        return  true;
    }

    //3、接口方法：在设置某个属性时调用
    public PropertyValues postProcessPropertyValues(PropertyValues pvs,PropertyDescriptor[] pds,Object bean,String beanName) throws BeansException{
        //3.1、仅对容器中car Bean进行处理,还可以通过pdst如参进行过滤
        //仅对car的某个特定属性进行处理
        if ("car".equals(beanName)) {
            System.out.println("InstantiationAware BeanPostProcessor.postProcessPropertyValues");
        }
        return  pvs;
    }
}
