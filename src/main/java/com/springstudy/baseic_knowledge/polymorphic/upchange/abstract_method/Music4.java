package com.springstudy.baseic_knowledge.polymorphic.upchange.abstract_method;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public class Music4 {
    static void tune(Instrument i){
        i.play(Note.MIDDLE_C);
    }

    static void tuneAll(Instrument[] e){
        for (Instrument i:e){
            tune(i);
        }
    }

    public static void main(String[] args) {
        Instrument[] orchestra={
                new Wind(),
                new Percussion(),
                new Stringed(),
                new Brass(),
                new WoodWind()
        };

        tuneAll(orchestra);
    }
}
