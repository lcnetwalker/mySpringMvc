package com.springstudy.baseic_knowledge.reuseclass.comprise;

/**
 * Created by xgjt on 15/8/20.
 */
public class SprinklerSystem {
    private String value1,value2,value3,value4;
    private WaterSource source = new WaterSource();
    private WaterSource2 source2 = new WaterSource2();

    private int i;
    private  float f;

    public String toString(){
        return  "value1 = "+value1+" " +
                "value2 = "+value2+" " +
                "value3 = "+value3+" " +
                "value4 = "+value4+"\n" +
                "i = "+i+" "+"f = "+f+" " +
                "source = "+source;
    }


    public static void main(String[] args) {
        SprinklerSystem sprinklerSystem = new SprinklerSystem();
        System.out.println(sprinklerSystem);
    }

}
