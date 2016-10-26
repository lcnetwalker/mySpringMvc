package com.springstudy.baseic_knowledge.generics.tuple;

/**
 * Created by xgjt on 15/9/15.
 */
public class TwoTuple<A,B> {
    public final A frist;
    public final B second;

    public TwoTuple(A frist, B second) {
        this.frist = frist;
        this.second = second;
    }

    public String toString(){
        return "("+frist+","+second+")";
    }
}
