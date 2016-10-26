package com.springstudy.service;

import java.util.*;

import com.gmk.framework.common.utils.DateUtils;
import com.springstudy.service.basic.DateClass;
import com.springstudy.service.basic.string.StringUtils;
import com.springstudy.service.exception.HrinfoException;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class Test implements Cloneable {
	private String attr;
	public static void main(String[] args) {

//		DateClass dc=new DateClass();
//		Date ds = dc.getDate("2015-03-01", "yyyy-MM-dd");
//		Date de = dc.getDate("2015-03-03", "yyyy-MM-dd");
//
//		List<Date> innerDates = dc.getInnerDates(ds,de);
//		System.out.println(innerDates);
//
//		Object o=new Object();
//		if (1==1){
//			try {
//				throw new HrinfoException("测试数据");
//			} catch (HrinfoException e) {
//				e.printStackTrace();
//			}
//		}


//		List<String> list=new ArrayList<>();
//		String m_sendpostid = "SGMK20043987,SGMK20043982,SGMK20043983,SGMK20043984,SGMK20051315,SGMK20051317,SGMK20051319";
//		String[] split = m_sendpostid.split(",");
//		for(String s:split){
//			String ss = s.substring(1);
//			list.add(ss);
//		}
//
//
//		Date m_endtime = DateUtils.str2Date("2016-04-21 08:38:19", DateUtils.datetimeFormat);
//
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(m_endtime);
//		int year = cal.get(Calendar.YEAR);
//		int month = cal.get(Calendar.MONTH);
//		int date = cal.get(Calendar.DATE);
//		int hour = cal.get(Calendar.HOUR_OF_DAY);
//		int i = cal.get(Calendar.MINUTE);
//
//		System.out.println(i);
//
//
//


		//3x+2y+0.5z=100;
		//x+y+z=100;
		int sum=0;
		for(int x=1;x<33;x++){
			for(int y=1;y<50;y++){
				for(int z=1;z<100;z++){
					if((3*x+2*y+0.5*z)==100 && (x+y+z)==100){
						sum++;
						System.out.println(x+"_"+y+"_"+z);
					}
				}
			}
		}
		System.out.println("总数"+sum);




	}
}
