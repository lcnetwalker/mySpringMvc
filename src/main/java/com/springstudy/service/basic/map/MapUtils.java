package com.springstudy.service.basic.map;

import com.gmk.flowcommon.exception.base.HRBaseRuntimeException;
import com.gmk.framework.common.utils.ListUtils;
import com.gmk.framework.common.utils.StringUtils;
import com.springstudy.model.PobcostSub;

import java.util.*;

/**
 * Created by xgjt on 16/3/28.
 */
public class MapUtils {



    public  void overshowObj(Map<String,String> map){


        //第一种：普遍使用，二次取值
        System.out.println("通过Map.keySet遍历key和value：");
        for (String key : map.keySet()) {
            System.out.println("key= "+ key + " and value= " + map.get(key));
        }



        //第二种
        System.out.println("通过Map.entrySet使用iterator遍历key和value：");
        Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> entry = it.next();
            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
        }

        //第三种：推荐，尤其是容量大时
        System.out.println("通过Map.entrySet遍历key和value");
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
        }

        //第四种
        System.out.println("通过Map.values()遍历所有的value，但不能遍历key");
        for (String v : map.values()) {
            System.out.println("value= " + v);
        }



    }

    /**
     * 获取Map<年,Map<月-value>> 的MAP
     * @param subs
     * @return
     */
    public static Map<String,Map<String,Double>> getYaMsums(List<PobcostSub> subs){

        Map<String,Map<String,Double>> map_years = new HashMap<>();

        if (ListUtils.isNotEmpty(subs)){
            List<Map> lst = new ArrayList<>();
            for (PobcostSub s:subs){

                String s_fee_year = s.getS_fee_year();
                String s_fee_month = s.getS_fee_month();

                Double v = Double.valueOf(s.getDmbtr());//费用

                if (StringUtils.isBlank(s_fee_year)){
                    throw new HRBaseRuntimeException("子表数据不全，缺少年份！");
                }
                if (StringUtils.isBlank(s_fee_month)){
                    throw new HRBaseRuntimeException("子表数据不全，缺少月份！");
                }


                Map<String,Double> map_year = map_years.get(s_fee_year);
                if (map_year==null){	//不存在年份
                    Map<String,Double> map_months = new HashMap<>();
                    map_months.put(s_fee_month, v);
                    map_years.put(s_fee_year,map_months);
                }else {//存在年份
                    Double v_month = map_year.get(s_fee_month);
                    if (v_month==null){//不存在该月
                        map_year.put(s_fee_month,v);
                    }else{//存在该月
                        v_month+=v;
                        map_year.put(s_fee_month,v_month);
                    }
                    map_years.put(s_fee_year,map_year);
                }
            }

            return map_years;
        }

        return null;
    }




    public static void main(String[] args) {

//        List<PobcostSub> subs = new ArrayList<>();
//
//        PobcostSub sub1=new PobcostSub();
//        sub1.setS_fee_year("2014");
//        sub1.setS_fee_month("01");
//        sub1.setDmbtr("34.1");
//
//        PobcostSub sub2=new PobcostSub();
//        sub2.setS_fee_year("2015");
//        sub2.setS_fee_month("01");
//        sub2.setDmbtr("1.1");
//
//        PobcostSub sub3=new PobcostSub();
//        sub3.setS_fee_year("2014");
//        sub3.setS_fee_month("01");
//        sub3.setDmbtr("34.1");
//
//        PobcostSub sub4=new PobcostSub();
//        sub4.setS_fee_year("2015");
//        sub4.setS_fee_month("02");
//        sub4.setDmbtr("2.1");
//
//        subs.add(sub1);
//        subs.add(sub2);
//        subs.add(sub3);
//        subs.add(sub4);
//
//        Map<String, Map<String, Double>> yaMsums = getYaMsums(subs);
//
//        System.out.println("MAP的内容：" + yaMsums);
//
//
//        System.out.println("遍历：");
//
//
//        Set<String> keys = yaMsums.keySet();
//        for (String s:keys){
//            Map<String, Double> map_s = yaMsums.get(s);
//
//            Set<String> s_keys = map_s.keySet();
//            for (String ss:s_keys){
//                Double aDouble = map_s.get(ss);
//                System.out.println("年："+s+" 月份："+ss+" 值："+aDouble);
//
//            }
//        }



        Map<String,Double> mp =new HashMap<>();
        Double aDouble = mp.get("1");
        System.out.println(aDouble);


    }
}
