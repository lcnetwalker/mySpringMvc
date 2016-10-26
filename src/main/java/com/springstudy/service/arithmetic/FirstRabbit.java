package com.springstudy.service.arithmetic;

import org.apache.commons.collections.ListUtils;

/**
 * Created by xgjt on 16/2/24.
 */
public class FirstRabbit {
    public static final int MONTH = 15;
    public static void main(String[] args) {
        long f1 = 1L, f2 = 1L;

        long f;
        for(int i=3; i<MONTH; i++) {
            f = f2; //当前的对数存储起来
            f2 = f1 + f2;   //递增
            f1 = f; //下个月要生的对数
            System.out.print("第" + i +"个月的兔子对数: ");
            System.out.println(" " + f2);
        }
    }


    public void sort(){

    }
}
