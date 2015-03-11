package com.mwl.util;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonActionUtil {

	public static BigDecimal round(float d, int decimalPlace) {
		BigDecimal bd = new BigDecimal(Float.toString(d));
		bd = bd.setScale(decimalPlace, BigDecimal.ROUND_HALF_UP);
		return bd;
	}
	
	public static Date getDateFromString(String dataAsString,String format)	{
		
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		Date date =null;
		try {
	 
			date = formatter.parse(dataAsString);
	 
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}
}
