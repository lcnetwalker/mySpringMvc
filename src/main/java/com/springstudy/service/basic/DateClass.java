package com.springstudy.service.basic;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.springstudy.service.basic.string.StringUtils;

/**
 * 时间处理类
 * @author Administrator
 *
 */
public class DateClass {

	/**
	 * 获取当前日期
	 * @return
	 */
	public Calendar getCalendar(){
		Calendar cl=Calendar.getInstance();
		return cl;
	}
	
	/**
	 * 获取日期　格式为date_format
	 * @param date_str
	 * @param date_format　例:yyyy-MM-dd
	 * @return
	 */
	public Date getDate(String date_str,String date_format){

		Date dt =new Date();

		if (!StringUtils.isBlank(date_format)) {
			SimpleDateFormat sdf=new SimpleDateFormat(date_format);
			try {
				dt = sdf.parse(date_str);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return dt;
	}
	
	/**
	 * 获取两时间点之间的datelist集合
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<Date> getInnerDates(Date startDate,Date endDate){
		
		List<Date> datelist=new ArrayList<Date>();
		
		Calendar sc=Calendar.getInstance();
		sc.setTime(startDate);
		Calendar ec=Calendar.getInstance();
		ec.setTime(endDate);
		
		datelist.add(startDate);
		
		while(ec.after(sc)) {
			sc.add(Calendar.DAY_OF_MONTH, 1);
			datelist.add(sc.getTime());
		}
		return datelist;
	}
}
