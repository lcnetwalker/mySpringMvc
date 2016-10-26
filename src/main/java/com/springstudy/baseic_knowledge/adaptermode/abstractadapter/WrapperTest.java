package com.springstudy.baseic_knowledge.adaptermode.abstractadapter;

/**
 * Created by xgjt on 15/9/18.
 */
public class WrapperTest {
    public static void main(String[] args) {

        SourceSub1 sourceSub1 = new SourceSub1();
        sourceSub1.method1();
        sourceSub1.method2();


        SourceSub2 sourceSub2 = new SourceSub2();
        sourceSub2.method1();
        sourceSub2.method2();
    }
}
