package com.springstudy.baseic_knowledge.generics.tuple;

import com.springstudy.baseic_knowledge.generics.Automobile;

/**
 * Created by xgjt on 15/9/15.
 */
public class TupleTest {

    static  TwoTuple<String,Integer> f(){
        //自动转换int到Integer
        return new TwoTuple<String,Integer>("hi",47);
    }


    static ThreeTuple<Automobile,String,Integer> g(){
        return new ThreeTuple<Automobile,String,Integer>(new Automobile(),"hi",47);
    }

    static FourTuple<Automobile,Automobile,String,Integer> h(){
        return new FourTuple<Automobile,Automobile,String,Integer>(new Automobile(),new Automobile(),"hi",47);
    }

    static FiveTuple<Automobile,Automobile,Automobile,String,Integer> i(){
        return new FiveTuple<Automobile,Automobile,Automobile,String,Integer>(new Automobile(),new Automobile(),new Automobile(),"hi",47);
    }

    public static void main(String[] args) {
        TwoTuple<String ,Integer> ttsi=f();
        System.out.println(ttsi);
        System.out.println(g());
        System.out.println(h());
        FiveTuple<Automobile, Automobile, Automobile, String, Integer> i = i();


    }
}
