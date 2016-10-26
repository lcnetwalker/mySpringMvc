package com.springstudy.baseic_knowledge.newInstance;

/**
 * Created by xgjt on 15/8/28.
 */
public class NewInstance {
    public static void main(String[] args) {
        try {
            //获取Dog类描述
            Class<?> aClass = Class.forName("com.springstudy.baseic_knowledge.newInstance.Dog");
            try {
                //实例化
                Dog o = (Dog)aClass.newInstance();
                o.call();
                o.Dog();


                //新的转型语法
                Object cast = aClass.cast(o);

            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
