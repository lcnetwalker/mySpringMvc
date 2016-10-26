package test.testInterfaceFactory;

import com.springstudy.service.test.interfacefactory.CatFactory;
import com.springstudy.service.test.interfacefactory.DogFactory;
import com.springstudy.service.test.interfacefactory.PigFactory;
import com.springstudy.service.test.testextends.animal.Animal;

/**
 * Created by xgjt on 15/8/11.
 */
public class TestInterFaceFactory {
    public static void main(String[] args) {

        DogFactory dogFactory = new DogFactory();
        Animal dog = dogFactory.createAnimal();
        dog.eat();

        PigFactory pigFactory = new PigFactory();
        Animal pig = pigFactory.createAnimal();
        pig.eat();

        CatFactory catFactory = new CatFactory();
        Animal cat = catFactory.createAnimal();
        cat.eat();

        //总结： 使用接口工厂模式，客户端不在负责对象的创建
        //只需要添加一个动物子类和工程类的子类即可，不需要修改之前的代码和结构，后期更容易维护，增加了系统的扩展性

        //缺点：需要编写额外代码，增加了工作量

    }
}
