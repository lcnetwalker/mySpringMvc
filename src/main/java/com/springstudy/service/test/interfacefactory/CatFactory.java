package com.springstudy.service.test.interfacefactory;

import com.springstudy.service.test.testextends.animal.Animal;
import com.springstudy.service.test.testextends.animal.Cat;

/**
 * Created by xgjt on 15/8/11.
 */
public class CatFactory  implements  AnimalFactory{

    @Override
    public Animal createAnimal() {
        return  new Cat();
    }
}
