package com.daxia.wz.common;

public enum ProfitDetailStatus {
	Succeed(1, "成功"), 
	Failed(2, "失败");

	private int value;
	private String remark;

	private ProfitDetailStatus(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static ProfitDetailStatus getByValue(int value) {
		for (ProfitDetailStatus o : ProfitDetailStatus.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
