package com.springstudy.baseic_knowledge.bridge_mode;

/**
 * Created by xgjt on 15/9/21.
 */
public abstract class Bridge {

    private Sourceable source;


    public  void method(){
        source.method();
    };


    public Sourceable getSource() {
        return source;
    }

    public void setSource(Sourceable source) {
        this.source = source;
    }
}
