package com.springstudy.baseic_knowledge.polymorphic.upchange.forgettype;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;
import com.springstudy.baseic_knowledge.polymorphic.upchange.Wind;

/**
 * 这样写很罗嗦，需要为每个类写特定的方法
 * Created by xgjt on 15/8/21.
 */
public class Music2 {
    public static void tune(Wind i){
        i.play(Note.MIDDLE_C);
    }
    public static void tune(Stringed i){
        i.play(Note.MIDDLE_C);
    }
    public static void tune(Brass i){
        i.play(Note.MIDDLE_C);
    }

    public static void main(String[] args) {
        Wind wind = new Wind();
        Stringed stringed = new Stringed();
        Brass brass = new Brass();
        tune(wind);
        tune(stringed);
        tune(brass);
    }
}
