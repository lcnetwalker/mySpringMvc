package com.springstudy.service.example;

import com.springstudy.model.Car0;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * //指定一组配置文件  Spring会在内存中“整合”成一个配置文件
 * Created by xgjt on 15/7/2.
 */
public class ApplicationContextS {

   public  static  void main(String[] args){
       ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
               new String[]{"com/springstudy/helloworld.xml", "classpath:com/springstudy/helloworld.xml"}
               );

       Car0 car = ctx.getBean("car", Car0.class);

        System.out.print("car.color:"+car.getColor());

   }
}
