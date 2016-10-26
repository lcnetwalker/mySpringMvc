package com.springstudy.baseic_knowledge.typeinfo.rtti;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/**
 * Created by xgjt on 15/8/25.
 */
public class Shapes {
    public static void main(String[] args) throws ClassNotFoundException {
        List<Shape> shapeList = Arrays.asList(
                new Circle(), new Square(), new Triangle()
        );

        for (Shape s:shapeList){
            s.draw();
        }


        Shapes shapes = new Shapes();
        Class<? extends Shapes> aClass1 = shapes.getClass();
        System.out.println("Shapes's type:"+ aClass1);


        Object o=shapes;
        //Class为保存对象的信息(属性值和方法内容)
        Class<?> aClass = o.getClass();
        System.out.println("o's type:"+ aClass);   //运行时类型判断 识别为：Shapes


        Constructor<?>[] constructors = aClass.getConstructors();
        for(Constructor c:constructors){
            System.out.println("构造方法s："+c);
        }


        Random random = new Random();
        for (int i=0;i<10;i++){
            System.out.println(random.nextInt(3));
        }


    }
}
