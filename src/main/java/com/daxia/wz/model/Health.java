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
import com.daxia.wz.model.Customer;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Health
 */
@Entity
@Table(name = "health") 
public class Health extends BaseModel {
	
	public Health() {
	}
	
	public Health(Long id) {
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
	 * 血红蛋白
	 */
	@Column(name = "xhdb")
    private String xhdb;
	/**
	 * 血常规
	 */
	@Column(name = "xzg")
    private String xzg;
	// 舒张压
	private Double szy;
	// 收缩压
	private Double ssy;
	/**
	 * 采集时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	@Column(name = "date")
    private Date date;
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
	
	public String getXhdb() {
    	return xhdb;
    }
	
    public void setXhdb(String xhdb) {
    	this.xhdb = xhdb;
    }
	
	public String getXzg() {
    	return xzg;
    }
	
    public void setXzg(String xzg) {
    	this.xzg = xzg;
    }
	
	public Date getDate() {
    	return date;
    }
	
    public void setDate(Date date) {
    	this.date = date;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }

	public Double getSzy() {
		return szy;
	}

	public void setSzy(Double szy) {
		this.szy = szy;
	}

	public Double getSsy() {
		return ssy;
	}

	public void setSsy(Double ssy) {
		this.ssy = ssy;
	}
    
}
