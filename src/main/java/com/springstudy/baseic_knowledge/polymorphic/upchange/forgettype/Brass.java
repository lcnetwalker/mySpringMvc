package com.springstudy.baseic_knowledge.polymorphic.upchange.forgettype;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Instrument;
import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/21.
 */
public class Brass extends Instrument {
    public void play(Note n){
        System.out.println("Brass.play() "+ n);
    }
}
