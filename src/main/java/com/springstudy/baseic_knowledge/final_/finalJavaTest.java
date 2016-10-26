package com.springstudy.baseic_knowledge.final_;

/**
 * Created by xgjt on 15/8/20.
 */
public class finalJavaTest {

    private  final int i=0;

    private final int j;

    private final finalJava p;

    public finalJavaTest(){
        j=1;
        p=new finalJava(1);
    }

    public finalJavaTest(int x){
        j=x;
        p=new finalJava(x);
    }

    public static void main(String[] args){

        finalJavaTest finalJavaTest = new finalJavaTest();
        System.out.println(finalJavaTest.i+" ");
        System.out.println(finalJavaTest.j+" ");
        System.out.println(finalJavaTest.p.toString()+" ");

        finalJavaTest finalJavaTest1 = new finalJavaTest(4);
        System.out.println(finalJavaTest1.i+" ");
        System.out.println(finalJavaTest1.j+" ");
        System.out.println(finalJavaTest1.p.toString()+" ");
    }
}
