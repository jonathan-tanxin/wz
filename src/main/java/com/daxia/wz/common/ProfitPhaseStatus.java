package com.daxia.wz.common;

public enum ProfitPhaseStatus {
	NotStart(0, "未开始"), 
	Succeed(1, "成功"),
	Failed(2, "失败");

	private int value;
	private String remark;

	private ProfitPhaseStatus(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static ProfitPhaseStatus getByValue(int value) {
		for (ProfitPhaseStatus o : ProfitPhaseStatus.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
