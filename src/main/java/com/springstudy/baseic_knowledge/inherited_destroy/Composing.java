package com.springstudy.baseic_knowledge.inherited_destroy;

/**
 * Created by xgjt on 15/8/21.
 */
public class Composing {
    private Shared shared;
    private static long counter = 0;
    private  final  long id = counter++;
    public  Composing(Shared shared){
        System.out.println("Creating "+this);
        this.shared=shared;
        this.shared.addRef();
    }

    protected void dispose(){
        System.out.println("disposing "+ this);
        shared.dispose();
    }

    public String toString(){
        return "Composing "+ id;
    }
}
