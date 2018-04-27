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
import org.springframework.format.annotation.DateTimeFormat;

/**
 * ProfitPhase
 */
@Entity
@Table(name = "profitphase") 
public class ProfitPhase extends BaseModel {
	
	public ProfitPhase() {
	}
	
	public ProfitPhase(Long id) {
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
	 * 返利
	 */
	@ManyToOne
	@JoinColumn(name = "profit_id")
    private Profit profit;
	/**
	 * 计划返利日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	@Column(name = "planDate")
    private Date planDate;
	/**
	 * 实际返利时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "actualTime")
    private Date actualTime;
	/**
	 * 状态0未开始，1成功，2失败
	 */
	@Column(name = "status")
    private Integer status;
	/**
	 * 失败原因
	 */
	@Column(name = "failMessage")
    private String failMessage;
	/**
	 * 期数
	 */
	@Column(name = "phase")
    private Integer phase;
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
	
	public Profit getProfit() {
    	return profit;
    }
	
    public void setProfit(Profit profit) {
    	this.profit = profit;
    }
	
	public Date getPlanDate() {
    	return planDate;
    }
	
    public void setPlanDate(Date planDate) {
    	this.planDate = planDate;
    }
	
	public Date getActualTime() {
    	return actualTime;
    }
	
    public void setActualTime(Date actualTime) {
    	this.actualTime = actualTime;
    }
	
	public Integer getStatus() {
    	return status;
    }
	
    public void setStatus(Integer status) {
    	this.status = status;
    }
	
	public String getFailMessage() {
    	return failMessage;
    }
	
    public void setFailMessage(String failMessage) {
    	this.failMessage = failMessage;
    }
	
	public Integer getPhase() {
    	return phase;
    }
	
    public void setPhase(Integer phase) {
    	this.phase = phase;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
}
