package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import java.util.Date;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Customer;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Profit
 */
@Entity
@Table(name = "profit") 
public class Profit extends BaseModel {
	
	public Profit() {
	}
	
	public Profit(Long id) {
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
	 * 受益用户
	 */
	@ManyToOne
	@JoinColumn(name = "profitCustomer_id")
    private Customer profitCustomer;
	/**
	 * 被邀用户
	 */
	@ManyToOne
	@JoinColumn(name = "inviteeCustomer_id")
    private Customer inviteeCustomer;
	/**
	 * 总期数
	 */
	@Column(name = "totalPhases")
    private Integer totalPhases;
	/**
	 * 月返利金额
	 */
	@Column(name = "profitPerMonth")
    private Double profitPerMonth;
	/**
	 * 反利总额
	 */
	@Column(name = "totalProfit")
    private Double totalProfit;
	/**
	 * 未返期数
	 */
	@Column(name = "notProfitPhases")
    private Integer notProfitPhases;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 最后更新时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "lastUpdateTime")
    private Date lastUpdateTime;
	
	/**
	 * 是否自动返利
	 */
	@Column(name = "isAuto")
	private Boolean isAuto;
	
	/**
	 * 关联payid
	 */
	@OneToOne
	@JoinColumn(name = "pay_id")
	private Pay pay;
	
	
	public Pay getPay() {
		return pay;
	}

	public void setPay(Pay pay) {
		this.pay = pay;
	}

	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public Customer getProfitCustomer() {
    	return profitCustomer;
    }
	
    public void setProfitCustomer(Customer profitCustomer) {
    	this.profitCustomer = profitCustomer;
    }
	
	public Customer getInviteeCustomer() {
    	return inviteeCustomer;
    }
	
    public void setInviteeCustomer(Customer inviteeCustomer) {
    	this.inviteeCustomer = inviteeCustomer;
    }
	
	public Integer getTotalPhases() {
    	return totalPhases;
    }
	
    public void setTotalPhases(Integer totalPhases) {
    	this.totalPhases = totalPhases;
    }
	
	public Double getProfitPerMonth() {
    	return profitPerMonth;
    }
	
    public void setProfitPerMonth(Double profitPerMonth) {
    	this.profitPerMonth = profitPerMonth;
    }
	
	public Double getTotalProfit() {
    	return totalProfit;
    }
	
    public void setTotalProfit(Double totalProfit) {
    	this.totalProfit = totalProfit;
    }
	
	public Integer getNotProfitPhases() {
    	return notProfitPhases;
    }
	
    public void setNotProfitPhases(Integer notProfitPhases) {
    	this.notProfitPhases = notProfitPhases;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public Date getLastUpdateTime() {
    	return lastUpdateTime;
    }
	
    public void setLastUpdateTime(Date lastUpdateTime) {
    	this.lastUpdateTime = lastUpdateTime;
    }

	public Boolean getIsAuto() {
		return isAuto;
	}

	public void setIsAuto(Boolean isAuto) {
		this.isAuto = isAuto;
	}
    
}
