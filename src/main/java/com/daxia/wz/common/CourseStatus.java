package com.daxia.wz.common;

public enum CourseStatus {
	Active(1, "有效"), NoActive(0, "无效");

	private int value;
	private String remark;

	private CourseStatus(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static CourseStatus getByValue(int value) {
		for (CourseStatus o : CourseStatus.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
