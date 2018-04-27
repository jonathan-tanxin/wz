package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Order;
import com.daxia.wz.model.Customer;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * CustomerBalanceDetail
 */
@Entity
@Table(name = "customerbalancedetail") 
public class CustomerBalanceDetail extends BaseModel {
	
	public CustomerBalanceDetail() {
	}
	
	public CustomerBalanceDetail(Long id) {
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
	 * 用户
	 */
	@ManyToOne
	@JoinColumn(name = "customer_id")
    private Customer customer;
	/**
	 * 变化前
	 */
	@Column(name = "balanceBefore")
    private Double balanceBefore;
	/**
	 * 变化量
	 */
	@Column(name = "amount")
    private Double amount;
	/**
	 * 变化后
	 */
	@Column(name = "balanceAfter")
    private Double balanceAfter;
	/**
	 * 关联订单
	 */
	@ManyToOne
	@JoinColumn(name = "order_id")
    private Order order;
	/**
	 * 时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "time")
    private Date time;
	/**
	 * 类型，1：菜品，2：桶装水
	 */
	@Column(name = "type")
    private Integer type;
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public Customer getCustomer() {
    	return customer;
    }
	
    public void setCustomer(Customer customer) {
    	this.customer = customer;
    }
	
	public Double getBalanceBefore() {
    	return balanceBefore;
    }
	
    public void setBalanceBefore(Double balanceBefore) {
    	this.balanceBefore = balanceBefore;
    }
	
	public Double getAmount() {
    	return amount;
    }
	
    public void setAmount(Double amount) {
    	this.amount = amount;
    }
	
	public Double getBalanceAfter() {
    	return balanceAfter;
    }
	
    public void setBalanceAfter(Double balanceAfter) {
    	this.balanceAfter = balanceAfter;
    }
	
	public Order getOrder() {
    	return order;
    }
	
    public void setOrder(Order order) {
    	this.order = order;
    }
	
	public Date getTime() {
    	return time;
    }
	
    public void setTime(Date time) {
    	this.time = time;
    }
	
	public Integer getType() {
    	return type;
    }
	
    public void setType(Integer type) {
    	this.type = type;
    }
	
}
