package com.daxia.wz.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtils {
	
	/**
	 * 返回一天的最开始的时候,00:00:00
	 * @param date
	 * @return
	 */
	public static Date getBeginningOfADay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 返回一天的最后的时候, 23:59:59
	 * @param date
	 * @return
	 */
	public static Date getEndOfADay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
     * 格式化输出日期
     * @param date 日期
     * @param format  格式
     * @return 返回字符型日期
     */
    public static String format(java.util.Date date, String format) {
        return format(date, format, Locale.getDefault());
    }
    
    /** 
     * 格式化输出日期 支持Locale
    * @param date 日期
    * @param format 格式
    * @param locale 返回字符型日期
    * @return
    */
    public static String format(java.util.Date date, String format, Locale locale) {
        try {
            if (null != date) {
                java.text.DateFormat df = new java.text.SimpleDateFormat(format, locale);
                return df.format(date);
            }
        } catch (Exception e) {
        }
        return "";
    }
    
    /**
     * 返回月初时间 
     * @param date
     * @return
     */
    public static Date getBeginingOfAMonth(Date date) {
    	Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
    }
    
    /**
     * 获取月末时间
     * @param date
     * @return
     */
    public static Date getEndOfAMonth(Date date) {
    	Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
    }
    
    public static Date getOneMonthLater(Date date) {
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(date);
    	cal.add(Calendar.MONTH, 1);
    	return cal.getTime();
    }

	
	public static void main(String[] args) {
	    Date now = new Date();
	    Date date = getBeginningOfADay(now);
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    System.out.println(dateFormat.format(date));
	    
	    date = getEndOfADay(now);
	    System.out.println(dateFormat.format(date));
	    
	    System.out.println(dateFormat.format(getBeginingOfAMonth(now)));
	    System.out.println(dateFormat.format(getEndOfAMonth(now)));
	    
	    
	    System.out.println(DateUtils.format(DateUtils.getOneMonthLater(date), "yyyy-MM-dd HH:mm:ss"));
    }
}
