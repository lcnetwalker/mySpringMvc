package test.testFactory;

import com.springstudy.service.test.animalfactory.AnimalFactory;
import com.springstudy.service.test.testextends.animal.Animal;
import com.springstudy.service.test.testextends.animal.Dog;
import com.springstudy.service.test.testextends.animal.Pig;

/**
 * Created by xgjt on 15/8/11.
 */
public class TestFactory {
    public static void main(String[] args) {
        Dog dog = AnimalFactory.creatDog();
        dog.eat();;

        Pig pig = AnimalFactory.createPig();
        pig.eat();

        //不能把父亲赋值给儿子
        //可以把儿子赋值给父亲
        Animal animal1 = AnimalFactory.createAnimal("dog");
        animal1.eat();

        Animal animal2 = AnimalFactory.createAnimal("pig");
        animal2.eat();



    }
}
