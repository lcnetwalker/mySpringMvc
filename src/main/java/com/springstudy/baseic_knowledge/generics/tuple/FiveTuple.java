package com.springstudy.baseic_knowledge.generics.tuple;

/**
 * Created by xgjt on 15/9/15.
 */
public class FiveTuple<A,B,C,D,E> extends FourTuple<A,B,C,D> {
    public final E fifth;

    public FiveTuple(A a, B b, C c, D d,E e) {
        super(a, b, c, d);
        fifth=e;
    }

    public  String toString(){
        return "("+frist+","+second+","+third+","+fourth+","+fifth+")";
    }
}
