package com.springstudy.baseic_knowledge.polymorphic.upchange;

/**
 * Created by xgjt on 15/8/21.
 */
public class Music {
    public static void tune(Instrument i){
        i.play(Note.MIDDLE_C);
    }

    public static void main(String[] args) {
        Wind wind = new Wind();
        tune(wind);
    }
}
