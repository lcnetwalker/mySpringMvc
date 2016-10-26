package com.springstudy.service.test.animalfactory;

import com.springstudy.service.test.testextends.animal.Animal;
import com.springstudy.service.test.testextends.animal.Dog;
import com.springstudy.service.test.testextends.animal.Pig;

/**
 * Created by xgjt on 15/8/11.
 */
public class AnimalFactory {

    public static Dog creatDog(){
        return  new Dog();
    }

    public static Pig createPig(){
        return  new Pig();
    }

    public static Animal createAnimal(String type){
        if ("pig".equals(type)){
            return new Pig();
        }
        if ("dog".equals(type)){
            return new Dog();
        }
        return null;
    }

    //总结，创建对象特别复杂的时候，用考虑使用工场模式来实现

    //缺点：当子类不断增多的时候，我们需要不断的修改工场的创建代码
}
