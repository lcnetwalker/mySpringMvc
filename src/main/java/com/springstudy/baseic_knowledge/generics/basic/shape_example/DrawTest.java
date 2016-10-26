package com.springstudy.baseic_knowledge.generics.basic.shape_example;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xgjt on 15/9/17.
 */
public class DrawTest extends Canvas {

    public void drawAll(List<? extends Shape> shapes) {
        //那么这时会出现一个编译时错误，原因在于：我们只知道shapes中的元素时Shape类型的子类型，
        // 具体是什么子类型我们并不清楚，所以我们不能往shapes中加入任何类型的对象。

//        不过我们在取出其中对象时，可以使用Shape类型来取值
//        shapes.add(new Rectangle());
        for (Shape s : shapes) {
            s.draw(this);
        }
    }

    public void test() {
        ArrayList<? super Circle> shapes = new ArrayList<Shape>();
        shapes.add(new Circle());
        shapes.add(new SmallCircle());

//        这表示cicleSupers列表存储的元素为Cicle的超类，因此我们可以往其中加入Cicle对象或者Cicle的子类对象，
//          但是不能加入Shape对象。这里的原因在于列表cicleSupers存储的元素类型为Cicle的超类，但是具体是Cicle的什么超类并不清楚。
//        shapes.add(new Shape());
    }

}
