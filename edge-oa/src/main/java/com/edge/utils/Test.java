package com.edge.utils;

import java.util.Calendar;

public class Test {

	public static void main(String[] args) {
	Calendar now = Calendar.getInstance();
		String year = String.valueOf(now.get(Calendar.YEAR));
		String month = String.valueOf(now.get(Calendar.MONTH) + 1);
		if (now.get(Calendar.MONTH) + 1 <= 9) {
			month = 0 + month;
		}
		String day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
		if (now.get(Calendar.DAY_OF_MONTH) <= 9) {
		day = 0 + day;
	}
		String Hourse = String.valueOf(now.get(Calendar.HOUR_OF_DAY));
		if (now.get(Calendar.HOUR_OF_DAY) <= 9) {
		Hourse = 0 + Hourse;
		}
		String minute = String.valueOf(now.get(Calendar.MINUTE));
		if (now.get(Calendar.MINUTE) <= 9) {
			minute = 0 + minute;
		}
		String second = String.valueOf(now.get(Calendar.SECOND));
		if (now.get(Calendar.SECOND) <= 9) {
			second = 0 + second;
		}
		// 产生六位随机数
		int a=(int) ((Math.random()*9+1)*100000);
		String x=String.valueOf(a);
		String time = year + month + day + Hourse + minute + second;
		String bh = "P" + time + x;
		System.out.println(bh+" "+bh.length());
	}
	
}
