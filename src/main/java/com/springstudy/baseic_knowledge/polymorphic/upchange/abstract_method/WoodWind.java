package com.springstudy.baseic_knowledge.polymorphic.upchange.abstract_method;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public class WoodWind extends Wind {
    public void play(Note n){
        System.out.println("WoodWind.play() "+n);
    }
    public String   what(){
        return "WoodWind";
    }
}
