package com.springstudy.service.test;

import com.springstudy.service.basic.HashMapClass;
import com.springstudy.service.basic.MapKeyComparator;

import java.util.*;

/**
 * Created by xgjt on 15/7/25.
 */
public class TestMap {




    public static void main(String[] args) {

        Map map1 = new HashMap();
        for (int i = 0; i < 5; i++) {
            map1.put(String.valueOf(i), Double.valueOf(i));
        }
        Map map2 = new HashMap();
        for (int i = 0; i < 10; i++) {
            map2.put(String.valueOf(i), Double.valueOf(i+6));
        }


        HashMapClass hmc=new HashMapClass();
        Map<String, Double> stringDoubleMap = hmc.CombineMap(map1, map2);

        List<Map.Entry<String, Double>> entries = hmc.sortMap(stringDoubleMap);

        System.out.println(entries.get(0));


    }
}
