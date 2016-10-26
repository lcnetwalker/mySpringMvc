package com.springstudy.baseic_knowledge.array;

/**
 * Created by xgjt on 15/8/19.
 */
public class ObjectArray {

    /**
     * 一个参数
     * @param args
     */
    static  void printArray(Object[] args){
        for(Object o:args){
            System.out.print(o+" ");
            System.out.println();
        }
    }


    /**
     * 可变参数
     * @param args
     */
    static  void printArray_k(Object ... args){
        for(Object o:args){
            System.out.print(o+" ");
            System.out.println();
        }
    }

    public static void main(String[] args) {
        printArray(new Object[]{
                new Integer(47), new Float(3.14), new Double(11.11)
        });

        printArray_k(new Object[]{"one", "two", "three"});

        printArray(new Object[]{new A(),new A(),new A()});
        
    }
}
