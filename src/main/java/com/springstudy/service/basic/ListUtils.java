package com.springstudy.service.basic;

import java.util.List;

public class ListUtils {

	/**
	 * List转字符串
	 * @param stringList
	 * @return
	 */
	public  String listToString(List<String> stringList){
        if (stringList==null) {
            return null;
        }
        StringBuilder result=new StringBuilder();
        boolean flag=false;
        for (String string : stringList) {
            if (flag) {
                result.append(",");
            }else {
                flag=true;
            }
            result.append(string);
        }
        return result.toString();
    }
}
