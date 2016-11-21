package com.springstudy.utils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class ListUtils {
	
	/**
	 * 集合是否为空
	 * isNotEmpty(new ArrayList()) = false
	 * isNotEmpty(Arrays.asList(1,2,3,4,5)) = true
	 * @param list
	 * @return
	 * @author duanqixin
	 * @date 2014年2月11日 上午8:52:39
	 */
	public static <T> boolean isNotEmpty(List<T> list) {
		if(list != null && list.size() > 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 集合是否为空
	 * isEmpty(new ArrayList()) = true
	 * isEmpty(Arrays.asList(1,2,3,4,5)) = false
	 * @param list
	 * @return
	 * @author duanqixin
	 * @date 2014年2月11日 上午8:56:09
	 */
	public static <T> boolean isEmpty(List<T> list) {
		return !isNotEmpty(list);
	}
	
	/**
	 * list去除重复(不保留顺序)
	 * @param list
	 * @return
	 * @author duanqixin
	 * @date 2014年2月12日 下午2:26:39
	 */
	public static <T> List<T> removeDuplicateNoOrder(List<T> list) {
		Set<T> set = new HashSet<T>(list);
		list.clear();
		list.addAll(set);
		return list;
	}
	
	/**
	 * list去除重复(保留顺序)
	 * @param list
	 * @return
	 * @author duanqixin
	 * @date 2014年2月12日 下午2:26:41
	 */
	public static <T> List<T> removeDuplicateOrder(List<T> list) {
		Set<T> set = new HashSet<T>();
		List<T> newList = new ArrayList<T>();
		for(Iterator<T> iter = list.iterator(); iter.hasNext();) {
			T element = iter.next();
		    if(set.add(element)) {
		    	newList.add(element);
		    }
	   	}
		return newList;
	}
	
	/**
	 * 获取两个集合相同的元素
	 * @param list1
	 * @param list2
	 * @return
	 * @author duanqixin
	 * @date 2014年2月12日 下午2:31:09
	 */
	public static <T> List<T> acquisitionSameElements(List<T> list1, List<T> list2) {
		List<T> resultlist = new ArrayList<T>();
		if(list1.size() > list2.size()) {
			for(T element : list2) {
				if(list1.contains(element)) {
					resultlist.add(element);
				}
			}
		}
		else {
			for(T element : list1) {
				if(list2.contains(element)) {
					resultlist.add(element);
				}
			}
		}
		
		return resultlist;
	} 
	
	/**
	 * 从大集合中移除小集合
	 * @param minList 小集合
	 * @param maxList 大集合
	 * @return
	 * @author duanqixin
	 * @date 2014年2月12日 下午2:47:32
	 */
	public static <T> List<T> removeSameElements(List<T> minList, List<T> maxList){
		maxList.removeAll(minList);
		return maxList;
	}
	
	/**
	 * 判断两个集合是否包含相同的元素
	 * @param list1
	 * @param list2
	 * @return
	 * @author duanqixin
	 * @date 2014年2月26日 上午9:48:57
	 */
	public static <T> boolean isContainSameElements(List<T> list1, List<T> list2) {
		if(list1.size() > list2.size()) {
			for(T element : list2) {
				if(list1.contains(element)) {
					return true;
				}
			}
		}
		else {
			for(T element : list1) {
				if(list2.contains(element)) {
					return true;
				}
			}
		}
		return false;
	}
	
	
}
