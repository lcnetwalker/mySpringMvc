package com.springstudy.beanfactory;

import com.springstudy.model.Car0;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

/**
 * Created by xgjt on 15/7/2.
 */
public class MyBeanPostProcessor implements BeanPostProcessor {

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        if(beanName.equals("car")){
            Car0 car = (Car0) bean;
            System.out.println("调用BeanPostProcessor.postProcess BeforeInitialzation() color为空，设置为默认黑色");
            car.setColor("黑色");
        }
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {

        if (beanName.equals("car")) {
            Car0 car = (Car0) bean;
            if(car.getMaxSpeed()>=200){
                System.out.println("调用BeanPostProcessor.postProcess AfterInitialzation(), 将maxSpeed调整为200.");
                car.setMaxSpeed(200);
            }
        }
        return bean;
    }
}
