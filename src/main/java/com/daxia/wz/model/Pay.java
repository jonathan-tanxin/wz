package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.Card;
import java.util.Date;
import javax.persistence.JoinColumn;

/**
 * Pay
 */
@Entity
@Table(name = "pay") 
public class Pay extends BaseModel {
	
	public Pay() {
	}
	
	public Pay(Long id) {
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
	
	private String prepayId;
	/**
	 * 系统内编号
	 */
	@Column(name = "payNO")
    private String payNO;
	/**
	 * 微信交易流水号
	 */
	@Column(name = "wxPayNo")
    private String wxPayNo;
	/**
	 * 应付金额
	 */
	@Column(name = "amount")
    private Double amount;
	/**
	 * 实付金额
	 */
	@Column(name = "actualPayAmount")
    private Double actualPayAmount;
	/**
	 */
	@Column(name = "type")
    private Integer type;
	/**
	 * 关联会员卡id
	 */
	@ManyToOne
	@JoinColumn(name = "card_id")
    private Card card;
	
	@ManyToOne
	@JoinColumn(name = "order_id")
    private Order order;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 支付更新时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "payUpdateTime")
    private Date payUpdateTime;
	/**
	 * 状态，0未支付，1，支付成功，2支付失败
	 */
	@Column(name = "status")
    private Integer status;
	
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
	
	public String getPayNO() {
    	return payNO;
    }
	
    public void setPayNO(String payNO) {
    	this.payNO = payNO;
    }
	
	public String getWxPayNo() {
    	return wxPayNo;
    }
	
    public void setWxPayNo(String wxPayNo) {
    	this.wxPayNo = wxPayNo;
    }
	
	public Double getAmount() {
    	return amount;
    }
	
    public void setAmount(Double amount) {
    	this.amount = amount;
    }
	
	public Double getActualPayAmount() {
    	return actualPayAmount;
    }
	
    public void setActualPayAmount(Double actualPayAmount) {
    	this.actualPayAmount = actualPayAmount;
    }
	
	public Integer getType() {
    	return type;
    }
	
    public void setType(Integer type) {
    	this.type = type;
    }
	
	public Card getCard() {
    	return card;
    }
	
    public void setCard(Card card) {
    	this.card = card;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public Date getPayUpdateTime() {
    	return payUpdateTime;
    }
	
    public void setPayUpdateTime(Date payUpdateTime) {
    	this.payUpdateTime = payUpdateTime;
    }
	
	public Integer getStatus() {
    	return status;
    }
	
    public void setStatus(Integer status) {
    	this.status = status;
    }

	public String getPrepayId() {
		return prepayId;
	}

	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
