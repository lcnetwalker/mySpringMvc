package com.springstudy.baseic_knowledge.interface_example.example.packageaccess;

import com.springstudy.baseic_knowledge.interface_example.example.interfaces.A;

/**
 * Created by xgjt on 15/9/15.
 */
class C implements A {
    @Override
    public void f() {
        System.out.println("C f()");
    }
    public void g(){
        System.out.println("C g()");
    }

    void u(){
        System.out.println("C u()");
    }

    protected void v(){
        System.out.println("C v()");
    }

    private void w(){
        System.out.println("C w()");
    }
}
