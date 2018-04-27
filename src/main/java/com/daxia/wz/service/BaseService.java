package com.daxia.wz.service;

public class BaseService {
	
	protected void error(String msg) {
		throw new RuntimeException(msg);
	}
}
