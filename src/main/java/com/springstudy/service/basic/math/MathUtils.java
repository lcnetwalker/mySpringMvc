package com.springstudy.service.basic.math;

import com.springstudy.service.basic.string.Rmb;
import com.springstudy.service.basic.string.StringUtils;

/**
 * Created by xgjt on 15/10/24.
 */
public class MathUtils {


    public static void main(String[] args) {

        double abs = Math.abs(-123.12321);  //绝对值
        System.out.println(abs);

        double ceil = Math.ceil(123.00);
        System.out.println(ceil);   //大于等于的最小整数

        double floor = Math.floor(-123.12);
        System.out.println(floor);  //小于等于的最大整数

        double max = Math.max(-0.123, -0.1);
        System.out.println(max);    //获取较大的值

        double min = Math.min(0.2112, 0.21);
        System.out.println(min);    //获取较小的值

        double rint = Math.rint(3.28);
        System.out.println(rint);   //最接近的整数 返回double

        long round = Math.round(9.21);
        System.out.println(round);  //最接近的整数 返回int

        double random = Math.random();
        System.out.println(random); //返回随机数
    }
}
