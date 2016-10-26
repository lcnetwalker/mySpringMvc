package com.springstudy.service.basic.test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xgjt on 16/5/10.
 */
public class Lottery {
    public static void main(String[] args) {


        String year="2222-01-03";
        System.out.println(year.substring(5,7));

        double baseNum = 0.5;
        String product = "矿泉水,打火机,雨伞,指甲刀";
        String num = "2,2,2,1";
        String[] p = product.split(",");
        String[] n = num.split(",");

        java.util.Random ran = new java.util.Random();
        double base = ran.nextDouble();

        if (base > baseNum) {
            System.err.println("没中奖");
            return;
        }

        List<String> list = new ArrayList<String>();
        for (int i = 0; i < p.length; i++) {
            for (int j = 0; j < Integer.parseInt(n[i]); j++) {
                list.add(p[i]);
            }
        }
        //TODO 打乱奖池数据
        int l = ran.nextInt(list.size());
        System.err.println(list.get(l));



    }
}
