package com.springstudy.baseic_knowledge.polymorphic.upchange.abstract_method;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public class Wind extends Instrument {
    @Override
    public void play(Note n) {
        System.out.println("Wind.play() "+n);
    }

    @Override
    public void adjust() {

    }

    public String what(){
        return "Wind";
    }

}
