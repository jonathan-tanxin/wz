package com.daxia.wz.common;

public enum SystemConfigType {
	
	@Deprecated
	appid("appid", null), // 公众号appi 没用到了
	@Deprecated
	appsecret("appsecret", null), // 公众号appsecret
	@Deprecated
	merchantId("merchantId", null), // 微信支付merchantId
	
	WxInterfaceToken("WxInterfaceToken", "testtoken"), // 微信接口配置的token
	Welcome("welcome", null), // 关注欢迎消息
	
	ImagePath("ImagePath", null),
	isTestServer("isTestServer", null),
	
	DishNotice("dishnotice", null), // 显示在会员点菜最下方
	None("none", null);

	private String value;
	private String defaultValue; 

	private SystemConfigType(String value, String defaultValue) {
		this.value = value;
		this.defaultValue = defaultValue;
	}

	public String value() {
		return this.value;
	}
	public String defaultValue() {
		return this.defaultValue;
	}
}
