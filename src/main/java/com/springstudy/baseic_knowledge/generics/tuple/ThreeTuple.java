package com.springstudy.baseic_knowledge.generics.tuple;

/**
 * Created by xgjt on 15/9/15.
 */
public class ThreeTuple<A,B,C> extends  TwoTuple {
    public  final  C third;

    public ThreeTuple(A a, B b, C c) {
        super(a, b);
        third=c;
    }

    public String toString(){
        return "("+frist+","+second+","+third+")";
    }
}
