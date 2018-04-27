package com.daxia.wz.common;

public enum ProfitDetailType {
	Auto(1, "自动"), 
	Manual(2, "手动");

	private int value;
	private String remark;

	private ProfitDetailType(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static ProfitDetailType getByValue(int value) {
		for (ProfitDetailType o : ProfitDetailType.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
