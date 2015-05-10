package cn.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * ���ڵ��ַ��?����
 *
 */
public class StringHandler {
	
	public static void main(String[] args) {
		System.out.println(getDifferMonth("2015-01-01", "2015-08-01"));
		System.out.println(getDifferDay("2015-01-01", "2015-08-01"));
		System.out.println(getAddDate("2015-02-28", 12));
		
		System.out.println(getAddDays("2015-02-28", -30));
		
		System.out.println(timeTostr(new Date()));
		
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format("2015-04-02"));
	}
	
	/**
	 * ��ݴ���������Լ���Ӽ��������ȡ֮�������?
	 * @param dateStr
	 * @param days
	 * @return
	 */
	public static String getAddDays(String dateStr,int days){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=df.parse(dateStr);
			Calendar c_end=Calendar.getInstance();
			c_end.setTime(date);
			c_end.set(Calendar.DAY_OF_MONTH, c_end.get(Calendar.DAY_OF_MONTH)+days);
			return df.format(c_end.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @desp ��ݴ�������ڻ�ȡ��������֮��������
	 * @param startdate ��ʼ������
	 * @param enddate ���������?
	 * @return
	 */
	public static int getDifferDay(String startdate,String enddate){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start=format.parse(startdate);
			Date end=format.parse(enddate);
			Calendar c_start=Calendar.getInstance();
			Calendar c_end=Calendar.getInstance();
			c_start.setTime(start);
			c_end.setTime(end);
			
			return (int) ((c_end.getTimeInMillis()-c_start.getTimeInMillis())/(1000*3600*24));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * @desp ��ݴ�������ڻ�ȡ��������֮����·ݲ��?0��Ϊһ�£�����double)
	 * @param startdate ��ʼ������
	 * @param enddate ���������?
	 * @return �·����Ϊ��?1Ϊ�����쳣
	 */
	public static double getDifferMonth(String startdate,String enddate){
		
		return getDifferDay(startdate, enddate)/30.0;
	}
	
	/**
	 * ��ݴ�������ںͼ��ϵ��·���õ��Ӻ������(ֻ���·ݽ�����ӣ�?
	 * @param dateStr ԭʼ����
	 * @param month ���ϵ��·���
	 * @return ���յ�����
	 */
	public static String getAddDate(String dateStr,int month){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		System.out.println(dateStr);
		try {
			date=df.parse(dateStr);
			Calendar c_end=Calendar.getInstance();
			c_end.setTime(date);
			c_end.set(Calendar.MONTH, c_end.get(Calendar.MONTH)+month);
			return df.format(c_end.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String timeTostr(Date date){
		String strDate="";
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strDate=format.format(date);
		return strDate;
	}
	
	public static String date2str(Date date){
		String strDate="";
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		strDate=format.format(date);
		return strDate;
	}
	
	public static String getSerial(Date date){
		long mse1=date.getTime();
		SimpleDateFormat fm=new SimpleDateFormat("yyyyMMddHHmmss");
		date.setTime(mse1);
		String serials=fm.format(date);
		return serials;
	}
	
	public static Date StringToDate(String dateStr){
		DateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=null;
		try {
			date = dd.parse(dateStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String changehtml(String str){
		String change="";
		if(str!=null && !str.equals("")){
			change=str.replace("&", "&amp;");
			change=change.replace(" ","&nbsp;");
			change=change.replace("<","&lt;");
			change=change.replace(">","&gt;");
			change=change.replace("\"","&quot;");
			change=change.replace("\r\n","<br>");
		}
		return change;
	}
	
}
