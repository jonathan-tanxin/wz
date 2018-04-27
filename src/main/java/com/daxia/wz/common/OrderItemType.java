package com.daxia.wz.common;

public enum OrderItemType {
	Dish(1, "xxx"), 
	Water(2, "xxx");

	private int value;
	private String remark;

	private OrderItemType(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public static OrderItemType getByValue(int value) {
		for (OrderItemType o : OrderItemType.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
