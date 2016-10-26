package com.springstudy.baseic_knowledge.reuseclass.comprise;

/**
 * Created by xgjt on 15/8/20.
 */
public class WaterSource {
    private String s;

    WaterSource(){
        System.out.println("WaterSource()");
        s="Constructed";
    }

    //@Override
    public String toString() {
        //return super.toString();
        return  s;
    }
}
