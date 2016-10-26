package com.springstudy.baseic_knowledge.inherited_destroy;

/**
 * Created by xgjt on 15/8/21.
 */
public class ReferenceCounting {
    public static void main(String[] args) {
        Shared shared = new Shared();
        Composing[] composing={
                new Composing(shared),
                new Composing(shared),
                new Composing(shared),
                new Composing(shared),
                new Composing(shared)
        };
        for (Composing c:composing){
            c.dispose();
        }
    }
}
