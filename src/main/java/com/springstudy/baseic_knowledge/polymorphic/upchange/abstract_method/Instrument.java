package com.springstudy.baseic_knowledge.polymorphic.upchange.abstract_method;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public abstract class Instrument {
    private int i;
    public abstract void play(Note n);
    public String what(){
        return "Instrument";
    }
    public abstract void adjust();
}
