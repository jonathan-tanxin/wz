package com.daxia.wz.common;

/**
 * 订单状态  	0：新下单 	1：处理中 	2：已派送 	3：已撤单 
 */
public enum OrderStatusOld {
	New(0, "新下单"),
	Processing(1, "处理中"),
	Sent(2, "已派送"),
	Cancelled(3, "已撤单"),
	Received(4, "已签收");
	
	private int value;
	private String remark;
	
	private OrderStatusOld(int value, String remark) {
		this.value = value;
		this.remark = remark;
    }
	
	public int getValue() {
		return value;
	}
	public String getRemark() {
		return remark;
	}
	
	public static OrderStatusOld getByValue(int value) {
		for (OrderStatusOld o : OrderStatusOld.values()) {
			if (o.getValue() == value) {
				return o;
			}
		}
		return null;
	}
}
