package com.springstudy.service.basic.date;//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//



import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.gmk.framework.common.utils.ListUtils;
import org.apache.commons.lang.time.DateFormatUtils;

public class DateUtils extends org.apache.commons.lang.time.DateUtils {
    private static String[] parsePatterns = new String[]{"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm"};
    public static final SimpleDateFormat date_sdf = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat date_sdf_MM_dd = new SimpleDateFormat("MM-dd");
    public static final SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
    public static final SimpleDateFormat yyMMdd = new SimpleDateFormat("yyMMdd");
    public static final SimpleDateFormat date_sdf_wz = new SimpleDateFormat("yyyy年MM月dd日");
    public static final SimpleDateFormat time_sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    public static final SimpleDateFormat yyyymmddhhmmss = new SimpleDateFormat("yyyyMMddHHmmss");
    public static final SimpleDateFormat short_time_sdf = new SimpleDateFormat("HH:mm");
    public static final SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final long DAY_IN_MILLIS = 86400000L;
    private static final long HOUR_IN_MILLIS = 3600000L;
    private static final long MINUTE_IN_MILLIS = 60000L;
    private static final long SECOND_IN_MILLIS = 1000L;

    public DateUtils() {
    }

    public static String formatDate(Date date, Object... pattern) {
        String formatDate = null;
        if(pattern != null && pattern.length > 0) {
            formatDate = DateFormatUtils.format(date, pattern[0].toString());
        } else {
            formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
        }

        return formatDate;
    }

    public static Date parseDate(Object str) {
        if(str == null) {
            return null;
        } else {
            try {
                return parseDate(str.toString(), parsePatterns);
            } catch (ParseException var2) {
                return null;
            }
        }
    }

    private static SimpleDateFormat getSDFormat(String pattern) {
        return new SimpleDateFormat(pattern);
    }

    public static Calendar getCalendar() {
        return Calendar.getInstance();
    }

    public static Calendar getCalendar(long millis) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date(millis));
        return cal;
    }

    public static Date getDate() {
        return new Date();
    }

    public static Date getDate(long millis) {
        return new Date(millis);
    }

    public static String timestamptoStr(Timestamp time) {
        Date date = null;
        if(null != time) {
            date = new Date(time.getTime());
        }

        return date2Str(date, date_sdf);
    }

    public static Timestamp str2Timestamp(String str) {
        Date date = str2Date(str, date_sdf);
        return new Timestamp(date.getTime());
    }

    public static synchronized Date str2Date(String str, SimpleDateFormat sdf) {
        if(null != str && !"".equals(str)) {
            Date date = null;

            try {
                date = sdf.parse(str);
                return date;
            } catch (ParseException var4) {
                var4.printStackTrace();
                return null;
            }
        } else {
            return null;
        }
    }

    public static synchronized String date2Str(SimpleDateFormat date_sdf) {
        Date date = getDate();
        return date_sdf.format(date);
    }

    public static String dataformat(String data, String format) {
        SimpleDateFormat sformat = new SimpleDateFormat(format);
        Date date = null;

        try {
            date = sformat.parse(data);
        } catch (ParseException var5) {
            var5.printStackTrace();
        }

        return sformat.format(date);
    }

    public static synchronized String date2Str(Date date, SimpleDateFormat date_sdf) {
        return null == date?null:date_sdf.format(date);
    }

    public static String getDate(String format) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public static Timestamp getTimestamp(long millis) {
        return new Timestamp(millis);
    }

    public static Timestamp getTimestamp(String time) {
        return new Timestamp(Long.parseLong(time));
    }

    public static Timestamp getTimestamp() {
        return new Timestamp((new Date()).getTime());
    }

    public static Timestamp getTimestamp(Date date) {
        return new Timestamp(date.getTime());
    }

    public static Timestamp getCalendarTimestamp(Calendar cal) {
        return new Timestamp(cal.getTime().getTime());
    }

    public static Timestamp gettimestamp() {
        Date dt = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = df.format(dt);
        Timestamp buydate = Timestamp.valueOf(nowTime);
        return buydate;
    }

    public static long getMillis() {
        return (new Date()).getTime();
    }

    public static long getMillis(Calendar cal) {
        return cal.getTime().getTime();
    }

    public static long getMillis(Date date) {
        return date.getTime();
    }

    public static long getMillis(Timestamp ts) {
        return ts.getTime();
    }

    public static synchronized String formatDate() {
        return date_sdf.format(getCalendar().getTime());
    }

    public static String getDataString(SimpleDateFormat formatstr) {
        return formatstr.format(getCalendar().getTime());
    }

    public static synchronized String formatDate(Calendar cal) {
        return date_sdf.format(cal.getTime());
    }

    public static synchronized String formatDate(Date date) {
        return date_sdf.format(date);
    }

    public static synchronized String formatDate(long millis) {
        return date_sdf.format(new Date(millis));
    }

    public static String formatDate(String pattern) {
        return getSDFormat(pattern).format(getCalendar().getTime());
    }

    public static String formatDate(Calendar cal, String pattern) {
        return getSDFormat(pattern).format(cal.getTime());
    }

    public static String formatDate(Date date, String pattern) {
        return getSDFormat(pattern).format(date);
    }

    public static synchronized String formatTime() {
        return time_sdf.format(getCalendar().getTime());
    }

    public static synchronized String formatTime(long millis) {
        return time_sdf.format(new Date(millis));
    }

    public static synchronized String formatTime(Calendar cal) {
        return time_sdf.format(cal.getTime());
    }

    public static synchronized String formatTime(Date date) {
        return time_sdf.format(date);
    }

    public static synchronized String formatShortTime() {
        return short_time_sdf.format(getCalendar().getTime());
    }

    public static synchronized String formatShortTime(long millis) {
        return short_time_sdf.format(new Date(millis));
    }

    public static synchronized String formatShortTime(Calendar cal) {
        return short_time_sdf.format(cal.getTime());
    }

    public static synchronized String formatShortTime(Date date) {
        return short_time_sdf.format(date);
    }

    public static Date parseDate(String src, String pattern) throws ParseException {
        return getSDFormat(pattern).parse(src);
    }

    public static Calendar parseCalendar(String src, String pattern) throws ParseException {
        Date date = parseDate(src, pattern);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }

    public static String formatAddDate(String src, String pattern, int amount) throws ParseException {
        Calendar cal = parseCalendar(src, pattern);
        cal.add(5, amount);
        return formatDate((Calendar)cal);
    }

    public static Timestamp parseTimestamp(String src, String pattern) throws ParseException {
        Date date = parseDate(src, pattern);
        return new Timestamp(date.getTime());
    }

    public static int dateDiff(char flag, Calendar calSrc, Calendar calDes) {
        long millisDiff = getMillis((Calendar)calSrc) - getMillis((Calendar)calDes);
        return flag == 121?calSrc.get(1) - calDes.get(1):(flag == 100?(int)(millisDiff / 86400000L):(flag == 104?(int)(millisDiff / 3600000L):(flag == 109?(int)(millisDiff / 60000L):(flag == 115?(int)(millisDiff / 1000L):0))));
    }

    public static int getYear() {
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.setTime(getDate());
        return calendar.get(1);
    }

    public static String getSpecifiedDayBefore(String specifiedDay) {
        Calendar c = Calendar.getInstance();
        Date date = null;

        try {
            date = (new SimpleDateFormat("yyyy-MM-dd")).parse(specifiedDay);
        } catch (ParseException var5) {
            var5.printStackTrace();
        }

        c.setTime(date);
        int day = c.get(5);
        c.set(5, day - 1);
        String dayBefore = (new SimpleDateFormat("yyyy-MM-dd")).format(c.getTime());
        return dayBefore;
    }

    public static String getSpecifiedDayAfter(String specifiedDay) {
        Calendar c = Calendar.getInstance();
        Date date = null;

        try {
            date = (new SimpleDateFormat("yyyy-MM-dd")).parse(specifiedDay);
        } catch (ParseException var5) {
            var5.printStackTrace();
        }

        c.setTime(date);
        int day = c.get(5);
        c.set(5, day + 1);
        String dayAfter = (new SimpleDateFormat("yyyy-MM-dd")).format(c.getTime());
        return dayAfter;
    }

    public static Date getSpecifiedDayBefore(Date specifiedDay) {
        Calendar c = Calendar.getInstance();
        if(specifiedDay != null) {
            c.setTime(specifiedDay);
        }

        int day = c.get(5);
        c.set(5, day - 1);
        return c.getTime();
    }

    public static Date getSpecifiedDayAfter(Date specifiedDay) {
        Calendar c = Calendar.getInstance();
        if(specifiedDay != null) {
            c.setTime(specifiedDay);
        }

        int day = c.get(5);
        c.set(5, day + 1);
        return c.getTime();
    }

    /**
     * 天数差
     * @param begin
     * @param end
     * @return
     */
    public static long getQuot(String begin, String end) {
        long quot = 0L;
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date e = ft.parse(begin);
            Date date2 = ft.parse(end);
            quot = date2.getTime() - e.getTime();
            quot /= 86400000L;
        } catch (ParseException var7) {
            var7.printStackTrace();
        }

        return quot;
    }

    public static long getQuot(Date begin, Date end) {
        long quot = 0L;

        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            quot = (end.getTime() - begin.getTime()) / 86400000L;
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return quot;
    }

    public static boolean before(Date begin, Date end) {
        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            return begin.before(end);
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static boolean after(Date begin, Date end) {
        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            return begin.after(end);
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static boolean same(Date begin, Date end) {
        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            return begin.equals(end);
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static boolean BeforeOrSame(Date begin, Date end) {
        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            return begin.before(end) || begin.equals(end);
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static boolean AfterOrSame(Date begin, Date end) {
        try {
            SimpleDateFormat e = new SimpleDateFormat("yyyy-MM-dd");
            begin = e.parse(e.format(begin));
            end = e.parse(e.format(end));
            return begin.after(end) || begin.equals(end);
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static int getMonth() {
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.setTime(getDate());
        return calendar.get(2) + 1;
    }

    public static int getQuarter() {
        int month = getMonth();
        return (month - 1) / 3 + 1;
    }

    public static List<Integer> getRecentYears(int many) {
        ArrayList result = new ArrayList();
        int nowYear = getYear();

        for(int i = 0; i < many; ++i) {
            result.add(Integer.valueOf(nowYear - i));
        }

        return result;
    }

    public static List<Integer> getBefAndAftYears(int many) {
        ArrayList result = new ArrayList();
        int nowYear = getYear();

        int i;
        for(i = many; i > 0; --i) {
            result.add(Integer.valueOf(nowYear + i));
        }

        for(i = 0; i < many; ++i) {
            result.add(Integer.valueOf(nowYear - i));
        }

        return result;
    }

    public static boolean between(String date, int start, int end, String type) {
        Date date1 = str2Date(date, date_sdf);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);
        int day;
        if("Y".equals(type)) {
            day = cal.get(1);
            if(day >= start && day <= end) {
                return true;
            }
        } else if("M".equals(type)) {
            day = cal.get(2);
            ++day;
            if(day >= start && day <= end) {
                return true;
            }
        } else if("D".equals(type)) {
            day = cal.get(5);
            if(day >= start && day <= end) {
                return true;
            }
        }

        return false;
    }

    /**
     * 返回最早的日期
     * @param dates
     * @return
     */
    public static Date getMiniDate(List<Date> dates){

        Date mini_date=new Date();

        if (ListUtils.isNotEmpty(dates)){
            Iterator<Date> iterator = dates.iterator();
            Date f_date = dates.get(0);

            while (iterator.hasNext()){
                Date next = iterator.next();
                if (before(f_date, next)){
                    mini_date=f_date;
                }else {
                    mini_date=next;
                }
            }
        }

        return mini_date;
    }

    /**
     * 返回最晚的日期
     * @param dates
     * @return
     */
    public static Date getMaxDate(List<Date> dates){
        Date max_date=new Date();

        if (ListUtils.isNotEmpty(dates)){
            Iterator<Date> iterator = dates.iterator();
            Date f_date = dates.get(0);

            while (iterator.hasNext()){
                Date next = iterator.next();
                if (before(f_date, next)){
                    max_date=next;
                }else {
                    max_date=f_date;
                }
            }
        }

        return max_date;
    }

    public static void main(String[] args) {
        String d1="2001-01-01";
        String d2="2001-01-02";
        String d3="2001-01-03";
        String d4="2001-01-04";

        Date date = str2Date(d1, date_sdf);
        Date date2 = str2Date(d2, date_sdf);
        Date date3 = str2Date(d3, date_sdf);
        Date date4 = str2Date(d4, date_sdf);

        List<Date> list=new ArrayList<>();
        list.add(date);
        list.add(date2);
        list.add(date3);
        list.add(date4);
        Date miniDate = getMiniDate(list);
        Date maxDate = getMaxDate(list);

        System.out.println(miniDate);
        System.out.println(maxDate);


    }
}
