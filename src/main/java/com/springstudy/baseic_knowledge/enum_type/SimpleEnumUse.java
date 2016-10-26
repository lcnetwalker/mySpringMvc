package com.springstudy.baseic_knowledge.enum_type;

/**
 * Created by xgjt on 15/8/19.
 */
public class SimpleEnumUse {

    public static void main(String[] args) {
        Spiciness howHot=Spiciness.MEDIUM;
        System.out.println(howHot);

        /**
         * 输出枚举类型中的所有常量，和声明顺序
         */
        for (Spiciness s:Spiciness.values()){
            System.out.println(s+", ordinal "+ s.ordinal());
        }


    }
}
