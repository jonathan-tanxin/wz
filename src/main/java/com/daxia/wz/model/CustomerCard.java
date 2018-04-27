package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import org.springframework.format.annotation.DateTimeFormat;
import com.daxia.wz.model.Customer;
import java.math.BigDecimal;
import com.daxia.wz.model.Card;
import java.util.Date;
import javax.persistence.JoinColumn;

/**
 * CustomerCard
 */
@Entity
@Table(name = "customercard") 
public class CustomerCard extends BaseModel {
	
	public CustomerCard() {
	}
	
	public CustomerCard(Long id) {
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
	 * 会员卡
	 */
	@ManyToOne
	@JoinColumn(name = "card_id")
    private Card card;
	/**
	 * 购买金额
	 */
	@Column(name = "money")
    private BigDecimal money;
	/**
	 * 开始时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "startTime")
    private Date startTime;
	/**
	 * 结束时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "endTime")
    private Date endTime;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	
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
	
	public Card getCard() {
    	return card;
    }
	
    public void setCard(Card card) {
    	this.card = card;
    }
	
	public BigDecimal getMoney() {
	    return moneyValue(money);
    }
	
    public void setMoney(BigDecimal money) {
    	this.money = money;
    }
	
	public Date getStartTime() {
    	return startTime;
    }
	
    public void setStartTime(Date startTime) {
    	this.startTime = startTime;
    }
	
	public Date getEndTime() {
    	return endTime;
    }
	
    public void setEndTime(Date endTime) {
    	this.endTime = endTime;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
}
