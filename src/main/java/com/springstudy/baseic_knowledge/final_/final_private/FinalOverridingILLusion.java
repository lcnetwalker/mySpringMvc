package com.springstudy.baseic_knowledge.final_.final_private;

/**
 * Created by xgjt on 15/8/21.
 */
public class FinalOverridingILLusion {
    public static void main(String[] args) {
        OverridingPrivate2 op2=new OverridingPrivate2();
        op2.f();
        op2.g();

        //向上转型
        OverridingPrivate op=op2;
        //但是不能执行下面方法
        //op.f();
        //op.g();

    }
}
