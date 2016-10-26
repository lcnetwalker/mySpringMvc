package com.springstudy.service.test.interfacefactory;

import com.springstudy.service.test.testextends.animal.Animal;
import com.springstudy.service.test.testextends.animal.Dog;

/**
 * Created by xgjt on 15/8/11.
 */
public class DogFactory implements AnimalFactory{
    @Override
    public Animal createAnimal() {
        return new Dog();
    }
}
