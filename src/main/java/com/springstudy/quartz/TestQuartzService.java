package com.springstudy.quartz;

import sun.util.calendar.CalendarUtils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by xgjt on 15/7/22.
 */
public class TestQuartzService {
    public void testquart(){
        Calendar cld= Calendar.getInstance();
        Date time = cld.getTime();
        System.out.println("定时执行quartz任务方法：testquart ，启动时间："+time);
    }
}
