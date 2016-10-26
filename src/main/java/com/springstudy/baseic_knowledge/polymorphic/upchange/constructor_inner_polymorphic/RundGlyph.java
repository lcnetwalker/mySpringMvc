package com.springstudy.baseic_knowledge.polymorphic.upchange.constructor_inner_polymorphic;

/**
 * Created by xgjt on 15/8/21.
 */
public class RundGlyph extends Glyph {
    private int radius=1;

    RundGlyph(int i){
        radius=i;
        System.out.println("RundGlyph.RundGlyph(), radius = "+ radius);
    }

    void draw(){
        System.out.println("RundGlyph.draw(), radius = "+ radius);
    }
}
