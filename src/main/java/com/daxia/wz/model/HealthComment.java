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
 * HealthComment
 */
@Entity
@Table(name = "healthcomment") 
public class HealthComment extends BaseModel {
	
	public HealthComment() {
	}
	
	public HealthComment(Long id) {
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
	 * 专家
	 */
	@ManyToOne
	@JoinColumn(name = "expertCustomer_id")
    private Customer expertCustomer;
	/**
	 * 点评内容
	 */
	@Column(name = "content")
    private String content;
	/**
	 * 点评时间
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
	
	public Customer getExpertCustomer() {
    	return expertCustomer;
    }
	
    public void setExpertCustomer(Customer expertCustomer) {
    	this.expertCustomer = expertCustomer;
    }
	
	public String getContent() {
    	return content;
    }
	
    public void setContent(String content) {
    	this.content = content;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
}
