package com.daxia.wz.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Order
 */
@Entity
@Table(name = "`order`") 
public class Order extends BaseModel {
	
	public Order() {
	}
	
	public Order(Long id) {
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
	 * 订单号
	 */
	@Column(name = "orderNo")
    private String orderNo;
	/**
	 * 状态
	 */
	@Column(name = "status")
    private Integer status;
	/**
	 * 订单总额
	 */
	@Column(name = "totalAmount")
    private Double totalAmount;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 配送状态
	 */
	@Column(name = "distributeStatus")
    private Integer distributeStatus;
	/**
	 * 完成这单后菜剩余可购
	 */
	@Column(name = "dishLeft")
    private Double dishLeft;
	/**
	 * 完成这单后水剩余可购
	 */
	@Column(name = "waterLeft")
    private Integer waterLeft;
	
	@OneToMany(mappedBy = "order")
	private List<OrderItem> orderItems = new ArrayList<>();
	
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
	
	public String getOrderNo() {
    	return orderNo;
    }
	
    public void setOrderNo(String orderNo) {
    	this.orderNo = orderNo;
    }
	
	public Integer getStatus() {
    	return status;
    }
	
    public void setStatus(Integer status) {
    	this.status = status;
    }
	
	public Double getTotalAmount() {
    	return totalAmount;
    }
	
    public void setTotalAmount(Double totalAmount) {
    	this.totalAmount = totalAmount;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public Integer getDistributeStatus() {
    	return distributeStatus;
    }
	
    public void setDistributeStatus(Integer distributeStatus) {
    	this.distributeStatus = distributeStatus;
    }
	
	public Double getDishLeft() {
    	return dishLeft;
    }
	
    public void setDishLeft(Double dishLeft) {
    	this.dishLeft = dishLeft;
    }
	
	public Integer getWaterLeft() {
    	return waterLeft;
    }
	
    public void setWaterLeft(Integer waterLeft) {
    	this.waterLeft = waterLeft;
    }

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
    
}
