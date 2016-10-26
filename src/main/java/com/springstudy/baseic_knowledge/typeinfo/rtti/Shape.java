package com.springstudy.baseic_knowledge.typeinfo.rtti;

/**
 * Created by xgjt on 15/8/25.
 */
public abstract class Shape {
    void draw(){
        System.out.println(this+".draw()");
    }
    abstract public String toString();
}
