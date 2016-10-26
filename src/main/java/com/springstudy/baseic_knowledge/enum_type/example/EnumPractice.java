package com.springstudy.baseic_knowledge.enum_type.example;

/**
 * Created by xgjt on 15/11/27.
 */
public class EnumPractice {
    public static void main(String[] args) {
        for (Week week:Week.values()){
            System.out.println("顺序："+week+" is "+week.ordinal());

            //用compareTo()方法来将当前枚举元素与Week.MONDAY比较
            System.out.println("Compare to MONDAY : " + week.compareTo(Week.MONDAY));

            //用equals()方法来将当前枚举元素与Week.MONDAY比较
            System.out.println("Equal to Monday?"+week.equals(Week.MONDAY));

            //用比较运算符==来将当前枚举元素与Week.MONDAY比较
            //从这里你应该可以看到，可以直接使用==来比较两个枚举元素
            System.out.println("Equal to Monday by =="+(week==Week.MONDAY));

            //使用name()方法获得枚举元素的名称
            System.out.println("Name ："+ week.name());

            //使用自定义的getAbbr()方法输出星期的缩写
            System.out.println("Abbreviation:"+week.getAbbr());

            System.out.println("-------------------");
            //在每次循环快要结束时，打印一条分割线用于区分
        }


    }
}
