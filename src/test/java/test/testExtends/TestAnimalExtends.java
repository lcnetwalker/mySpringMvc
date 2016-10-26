package test.testExtends;

import com.springstudy.service.test.testextends.animal.Dog;
import com.springstudy.service.test.testextends.animal.Pig;

/**
 * Created by xgjt on 15/8/11.
 */
public class TestAnimalExtends {
    public static void main(String[] args) {

        Dog dog = new Dog();
        dog.eat();

        Pig pig = new Pig();
        pig.eat();

    }
}
