package com.daxia.wz.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Example
 */
@Entity
@Table(name = "example") 
public class Example extends BaseModel {
	/**
	 * id
	 */
	@Id
	@GeneratedValue
	@Column(name = "id")
    private Long id;
	/**
	 * 用户名
	 */
	@Column(name = "username")
    private String username;
	/**
	 * 创建日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	@Column(name = "createDate")
    private Date createDate;
	/**
	 * 姓名
	 */
	@Column(name = "myname")
    private String myname;
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public String getUsername() {
    	return username;
    }
	
    public void setUsername(String username) {
    	this.username = username;
    }
	
	public Date getCreateDate() {
    	return createDate;
    }
	
    public void setCreateDate(Date createDate) {
    	this.createDate = createDate;
    }
	
	public String getMyname() {
    	return myname;
    }
	
    public void setMyname(String myname) {
    	this.myname = myname;
    }
	
}
