package com.springstudy.beanfactory;

import com.springstudy.model.Car;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

/**
 * Created by xgjt on 15/7/2.
 */
public class BeanLifeCycle {
    private static void LifeCycleInBeanFactory(){

        //1、下面两句装在配置文件并启动容器
        ClassPathResource res = new ClassPathResource("com/springstudy/helloworld.xml");
        XmlBeanFactory bf = new XmlBeanFactory(res);

        //2、向容器中注册MyBeanPostProcessor后处理器
        ((ConfigurableBeanFactory)bf).addBeanPostProcessor(new MyBeanPostProcessor());

        //3、向容器中注册MyInstantiationAwareBeanPostProcessor后处理器
        ((ConfigurableBeanFactory)bf).addBeanPostProcessor(new MyInstantiationAwareBeanPostProcessor());

        //4、第一次从容器中获取car，将触发容器实例化该Bean，这将引发Bean生命周期方法的调用
        Car car1 = (Car) bf.getBean("car");

        car1.introduce();
        car1.setColor("红色");

        //5、第二次从容器中获取car，直接从缓存池中获取
        Car car2 = (Car) bf.getBean("car");

        //6、查看car1和car2是否指向同一引用
        System.out.println("car1==car2:"+(car1==car2));

        //7、关闭容器
        ((XmlBeanFactory)bf).destroySingletons();
    }

    public static  void main(String[] arg){
        LifeCycleInBeanFactory();
    }
}
