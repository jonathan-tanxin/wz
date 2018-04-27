package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

/**
 * Course
 */
@Entity
@Table(name = "course") 
public class Course extends BaseModel {
	
	public Course() {
	}
	
	public Course(Long id) {
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
	 * 标题
	 */
	@Column(name = "title")
    private String title;
	/**
	 * 图片
	 */
	@Column(name = "image")
    private String image;
	/**
	 * 主讲人
	 */
	@Column(name = "host")
    private String host;
	/**
	 * 日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "date")
    private Date date;
	/**
	 * 状态
	 */
	@Column(name = "status")
    private Integer status;
	/**
	 * 链接
	 */
	@Column(name = "href")
    private String href;
	
	@Column(name = "isdel")
	private Integer isdel;
	
	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public String getTitle() {
    	return title;
    }
	
    public void setTitle(String title) {
    	this.title = title;
    }
	
	public String getImage() {
    	return image;
    }
	
    public void setImage(String image) {
    	this.image = image;
    }
	
	public String getHost() {
    	return host;
    }
	
    public void setHost(String host) {
    	this.host = host;
    }
	
	public Date getDate() {
    	return date;
    }
	
    public void setDate(Date date) {
    	this.date = date;
    }
	
	public Integer getStatus() {
    	return status;
    }
	
    public void setStatus(Integer status) {
    	this.status = status;
    }
	
	public String getHref() {
    	return href;
    }
	
    public void setHref(String href) {
    	this.href = href;
    }
	
}
