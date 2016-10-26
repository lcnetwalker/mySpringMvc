package com.springstudy.baseic_knowledge.polymorphic.upchange.constructor_inner_polymorphic;

/**
 * Created by xgjt on 15/8/21.
 */
public class Glyph {
    //其子类能够覆盖该方法
    void draw(){
        System.out.println("Glyph.draw()");
    }

    Glyph(){
        System.out.println("Glyph() before draw()");
        draw();
        System.out.println("Glyph() after draw()");
    }
}
