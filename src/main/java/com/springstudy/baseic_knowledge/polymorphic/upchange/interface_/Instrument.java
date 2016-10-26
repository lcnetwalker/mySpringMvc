package com.springstudy.baseic_knowledge.polymorphic.upchange.interface_;

import com.springstudy.baseic_knowledge.polymorphic.upchange.Note;

/**
 * Created by xgjt on 15/8/24.
 */
public interface Instrument {
    int VALUE=5;  //static&final
    void play(Note n); //Automatically public
    void adjust();
}
