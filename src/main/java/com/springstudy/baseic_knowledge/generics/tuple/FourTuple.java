package com.springstudy.baseic_knowledge.generics.tuple;

/**
 * Created by xgjt on 15/9/15.
 */
public class FourTuple<A,B,C,D> extends ThreeTuple<A,B,C> {
    public final D fourth;
    public FourTuple(A a, B b, C c,D d) {
        super(a, b, c);
        fourth=d;
    }

    public String toString(){
        return "("+frist+","+second+","+third+","+fourth+")";
    }
}
