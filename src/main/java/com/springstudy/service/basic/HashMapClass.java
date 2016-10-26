package com.springstudy.service.basic;

import java.math.BigDecimal;
import java.util.*;
import java.util.Map.Entry;

public class HashMapClass {

	public   String str1="11,12,13,11,12";		//项目号字符串
	public   String str2="21,22,23,21,22";		//子项目号字符串
	public   String str3="1,2,3,4,5";			//总金额
	
	/**
	 * 获取集合中对象属性相同的，另一个属性之和，重新组成的新的对象集合
	 * @param str1
	 * @param str2
	 * @param str3
	 * @return
	 */
	public static Map<String, Double> getHashMap(String str1,String str2,String str3){

		String[] s1 = str1.split(",");
		String[] s2 = str2.split(",");
		String[] s3 = str3.split(",");
		
		Map<String, Double> hmap=new HashMap<String,Double>();
		for (int i = 0; i < s3.length; i++) {
			String ss1 = s1[i];
			String ss2 = s2[i];
			String ss3 = s3[i];
		
			String key=ss1+"-"+ss2;
			Double val=null;
			val=hmap.get(key);	//获取key对应的value
			
			if (val!=null) {
				hmap.put(key, Double.parseDouble(ss3)+val);
			}else{
				hmap.put(key, Double.parseDouble(ss3));
			}
		}
		
		Set<Entry<String, Double>> entrySet=hmap.entrySet();
		for (Entry<String, Double> entry : entrySet) {
			System.out.println(entry.getKey()+"======"+entry.getValue());
			
		}
		return null;
	}

	/**
	 * 获取两个Map的和，相同的累加到目标map，不同的添加到目标map
	 * @param s_map
	 * @param t_map
	 * @return
	 */
	public static Map<String ,Double> CombineMap(Map<String ,Double> s_map,Map<String ,Double> t_map){

		for (Map.Entry<String,Double> entry:s_map.entrySet()){
			String key = entry.getKey();
			if (t_map.containsKey(key)){
				BigDecimal s_b=new BigDecimal(entry.getValue());
				BigDecimal t_b=new BigDecimal(t_map.get(key));

				double sum = s_b.add(t_b).doubleValue();
				t_map.put(key,sum);
			}else {
				t_map.put(entry.getKey(),entry.getValue());
			}
		}

		return  t_map;
	}


	/**
	 * MAP排序   转化成List<Map>
	 * @param map
	 * @return
	 */
	public static List<Entry<String, Double>> sortMap(Map<String ,Double> map){
		//排序 按照key
		List<Entry<String, Double>> infoIds =
				new ArrayList<Entry<String, Double>>(map.entrySet());

		Collections.sort(infoIds, new Comparator<Map.Entry<String, Double>>() {
			public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {
				//return (o2.getValue() - o1.getValue());
				return (o1.getKey()).toString().compareTo(o2.getKey());
			}
		});

		return  infoIds;
	}

	public static void main(String[] args) {
//		HashMapClass hmc=new HashMapClass();
//		String str1=hmc.str1;
//		String str2=hmc.str2;
//		String str3=hmc.str3;
//
//		Map<String, Double> hashMap = getHashMap(str1, str2, str3);

		Map map1 = new HashMap();
		for (int i = 0; i < 5; i++) {
			map1.put(String.valueOf(i), Double.valueOf(i));
		}
		Map map2 = new HashMap();
		for (int i = 0; i < 10; i++) {
			map2.put(String.valueOf(i), Double.valueOf(i+6));
		}

		Map<String, Double> endM = CombineMap(map1, map2);

		System.out.println(endM);

	}
	
	
	
}
