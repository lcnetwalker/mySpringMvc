package com.springstudy.service.example;

import com.springstudy.model.Car0;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import java.io.IOException;

/**
 * Created by xgjt on 15/7/2.
 */
public class BeanFactoryExample {
    public  static  void main(String [] args) throws IOException {
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        Resource res = resolver.getResource("classpath:com/springstudy/helloworld.xml");
        //Resource res = resolver.getResource("classpath: com/springstudy/src/**/helloworld.xml");
        BeanFactory bf = new XmlBeanFactory(res);

        System.out.println("init BeanFactory");
        Car0 car = bf.getBean("car", Car0.class);
        System.out.print("car bean is ready for use");
    }
}
