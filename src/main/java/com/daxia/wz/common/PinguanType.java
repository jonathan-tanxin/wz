package com.daxia.wz.common;

/**
 * 品馆类型
 * @author kevin
 *
 */
public enum PinguanType {
	Jinkou(1, "进口馆"),
	Dingzhi(2, "定制馆"),
	Pinpai(3, "品牌馆"),
	Gexing(4, "个性馆");

	private int value;
	private String remark;

	private PinguanType(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static PinguanType getByValue(int value) {
		for (PinguanType o : PinguanType.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
