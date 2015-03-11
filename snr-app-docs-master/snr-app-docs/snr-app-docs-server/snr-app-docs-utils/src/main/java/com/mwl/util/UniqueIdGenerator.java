package com.mwl.util;

import java.util.UUID;

public class UniqueIdGenerator {

	public static String getNewId(){
		 return UUID.randomUUID().toString();
	}
}
