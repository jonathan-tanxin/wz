package com.daxia.wz.common;

/**
 * 状态， 0待确认，1待发货， 2待收货， 3已收货， 4已完成， 5已关闭
 * @author kevin
 *
 */
public enum OrderStatusQuery {
	WaitConfirm(0, "待确认"),
	WaitDeliver(1, "待发货", WaitConfirm),
	WaitReceive(2, "待收货", WaitDeliver),
	Received(3, "已收货", WaitReceive),
	Finished(4, "已完成", Received),
	Closed(5, "已关闭", Finished);

	private int value;
	private String remark;
	private OrderStatusQuery dependentStatus;

	private OrderStatusQuery(int value, String remark) {
		this.value = value;
		this.remark = remark;
	}

	private OrderStatusQuery(int value, String remark, OrderStatusQuery dependentStatus) {
		this.value = value;
		this.remark = remark;
		this.dependentStatus = dependentStatus;
	}

	public int getValue() {
		return value;
	}

	public String getRemark() {
		return remark;
	}

	public OrderStatusQuery getDependentStatus() {
		return dependentStatus;
	}

	public static OrderStatusQuery getByValue(int value) {
		for (OrderStatusQuery o : OrderStatusQuery.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
