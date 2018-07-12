package com.spring.resume.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class NSCTagLib {	
	
	private static Log log = LogFactory.getLog(NSCTagLib.class);
	
	public static String selectBox(String id) {
		String rtnStr = "";
		rtnStr = "<select name='" + id + "' id='" + id + "'>";
		for (int i=1; i <= 50; i++) {
			String value = "";
			if (i < 10)
				value = "0" + String.valueOf(i);
			else
				value = String.valueOf(i);
			rtnStr += "  <option value=\"" + value + "\">" + value + "</option>";
		}
		rtnStr += "</select>";

		return rtnStr;
	}
}
