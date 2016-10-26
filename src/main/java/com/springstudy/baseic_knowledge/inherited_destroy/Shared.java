package com.springstudy.baseic_knowledge.inherited_destroy;

/**
 * Created by xgjt on 15/8/21.
 */
public class Shared {
    private  int refcount=0;
    private static long conter=0;
    private final long  id=conter++;

    public Shared(){
        System.out.println("Creating " + this);
    }

    public void addRef(){
        refcount++;
    }

    protected void dispose(){
        if ((--refcount==0)){
            System.out.println("Disposing "+this);
        }
    }

    public String toString(){
        return "Shared "+ id;
    }
}
