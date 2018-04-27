package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import com.daxia.wz.model.Profit;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Customer;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * ProfitDetail
 */
@Entity
@Table(name = "profitdetail") 
public class ProfitDetail extends BaseModel {
	
	public ProfitDetail() {
	}
	
	public ProfitDetail(Long id) {
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
	 * 返利类型，1自动，2手动
	 */
	@Column(name = "type")
    private Integer type;
	/**
	 * 用户
	 */
	@ManyToOne
	@JoinColumn(name = "customer_id")
    private Customer customer;
	/**
	 * 返利id
	 */
	@ManyToOne
	@JoinColumn(name = "profit_id")
    private Profit profit;
	/**
	 * 返利时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "profitTime")
    private Date profitTime;
	/**
	 * 状态，1成功，2失败
	 */
	@Column(name = "status")
    private Integer status;
	/**
	 * 返利金额
	 */
	@Column(name = "amount")
    private Double amount;
	/**
	 * 当前返的是第几期
	 */
	@Column(name = "phase")
    private Integer phase;
	/**
	 * 总共多少期
	 */
	@Column(name = "totalPhases")
    private Integer totalPhases;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 备注
	 */
	@Column(name = "remark")
    private String remark;
	
	/**
	 * 返利失败原因
	 */
	private String failMessage;

	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public Integer getType() {
    	return type;
    }
	
    public void setType(Integer type) {
    	this.type = type;
    }
	
	public Customer getCustomer() {
    	return customer;
    }
	
    public void setCustomer(Customer customer) {
    	this.customer = customer;
    }
	
	public Profit getProfit() {
    	return profit;
    }
	
    public void setProfit(Profit profit) {
    	this.profit = profit;
    }
	
	public Date getProfitTime() {
    	return profitTime;
    }
	
    public void setProfitTime(Date profitTime) {
    	this.profitTime = profitTime;
    }
	
	public Integer getStatus() {
    	return status;
    }
	
    public void setStatus(Integer status) {
    	this.status = status;
    }
	
	public Double getAmount() {
    	return amount;
    }
	
    public void setAmount(Double amount) {
    	this.amount = amount;
    }
	
	public Integer getPhase() {
    	return phase;
    }
	
    public void setPhase(Integer phase) {
    	this.phase = phase;
    }
	
	public Integer getTotalPhases() {
    	return totalPhases;
    }
	
    public void setTotalPhases(Integer totalPhases) {
    	this.totalPhases = totalPhases;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public String getRemark() {
    	return remark;
    }
	
    public void setRemark(String remark) {
    	this.remark = remark;
    }

	public String getFailMessage() {
		return failMessage;
	}

	public void setFailMessage(String failMessage) {
		this.failMessage = failMessage;
	}
    
}
