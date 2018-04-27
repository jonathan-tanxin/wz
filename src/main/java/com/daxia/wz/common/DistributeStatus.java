package com.daxia.wz.common;

public enum DistributeStatus {
	Test1(1, "中心待送货"), 
	Test2(2, "中心已收货");

	private int value;
	private String remark;

	private DistributeStatus(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static DistributeStatus getByValue(int value) {
		for (DistributeStatus o : DistributeStatus.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
