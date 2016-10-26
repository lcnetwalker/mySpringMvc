package com.springstudy.baseic_knowledge.polymorphic.upchange.interface_;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public class Percussion implements Instrument {
    @Override
    public void play(Note n) {
        System.out.println(this+".play()"+n);
    }

    @Override
    public void adjust() {
        System.out.println(this+"adjust()");
    }

    public String toString(){
        return "Percussion";
    }
}
