package com.daxia.wz.dto;

import com.daxia.wz.model.Address;
import com.daxia.wz.model.Order;
import com.daxia.wz.model.OrderItem;

public class OrderDTO extends Order {

	private String ids;

	private AddressDTO address;

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	private int orderCount;
	
	public void setAddress(AddressDTO address) {
    	this.address = address;
    }
	
	public AddressDTO getAddress() {
    	return address;
    }
	
	private OrderItemDTO orderItemDTO;
	
	public void setOrderItemDTO(OrderItemDTO orderItemDTO) {
    	this.orderItemDTO = orderItemDTO;
    }
	
	public OrderItemDTO getOrderItemDTO() {
    	return orderItemDTO;
    }

    public int getOrderCount(){
		int count = 0;
		if(this.getOrderItems() != null && this.getOrderItems().size() > 0){
			for(int i = 0; i < this.getOrderItems().size(); i++){
				OrderItem oi = this.getOrderItems().get(i);
				count += oi.getNum();
			}
		}
		orderCount = count;
		return orderCount;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}






}
