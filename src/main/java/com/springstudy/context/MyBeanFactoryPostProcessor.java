package com.springstudy.context;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

/**
 * Created by xgjt on 15/7/2.
 */
public class MyBeanFactoryPostProcessor implements BeanFactoryPostProcessor{

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory bf) throws BeansException {
        BeanDefinition bd = bf.getBeanDefinition("car");

        bd.getPropertyValues().addPropertyValue("brand","奇瑞QQ");
        System.out.println("调用BeanFactoryPostProcessor.postProcessBean Factory()!");
    }
}
