package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import com.daxia.wz.model.Order;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Dish;

/**
 * OrderItem
 */
@Entity
@Table(name = "orderitem") 
public class OrderItem extends BaseModel {
	
	public OrderItem() {
	}
	
	public OrderItem(Long id) {
		this.id = id;
	}
	
	/**
	 * id
	 */
	@Id
	@GeneratedValue
	@Column(name = "id")
    private Long id;
	/**
	 * 订单
	 */
	@ManyToOne
	@JoinColumn(name = "order_id")
    private Order order;
	/**
	 * 菜品
	 */
	@ManyToOne
	@JoinColumn(name = "dish_id")
    private Dish dish;
	/**
	 * 金额
	 */
	@Column(name = "amount")
    private Double amount;
	/**
	 * 购买类型，1，菜品，2：桶装水
	 */
	@Column(name = "type")
    private Integer type;
	
	/**
	 * 数量
	 */
	private int num;
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public Order getOrder() {
    	return order;
    }
	
    public void setOrder(Order order) {
    	this.order = order;
    }
	
	public Dish getDish() {
    	return dish;
    }
	
    public void setDish(Dish dish) {
    	this.dish = dish;
    }
	
	public Double getAmount() {
    	return amount;
    }
	
    public void setAmount(Double amount) {
    	this.amount = amount;
    }
	
	public Integer getType() {
    	return type;
    }
	
    public void setType(Integer type) {
    	this.type = type;
    }

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
    
}
