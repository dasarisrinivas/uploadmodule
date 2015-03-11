package com.mwl.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomLoggerFactory {

	
	protected static Logger logger = LoggerFactory
			.getLogger(CustomLoggerFactory.class);
	
	public static void log (String message,String className) {
		logger.info("className ::"+message);
	}
}
