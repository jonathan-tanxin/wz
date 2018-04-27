package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;


/**
 * Category
 */
@Entity
@Table(name = "category") 
public class Category extends BaseModel {
	
	public Category() {
	}
	
	public Category(Long id) {
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
	 * 类别名称
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 图片
	 */
	@Column(name = "image")
    private String image;
	private boolean isWater;
	
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
	
	public String getName() {
    	return name;
    }
	
    public void setName(String name) {
    	this.name = name;
    }
	
	public String getImage() {
    	return image;
    }
	
    public void setImage(String image) {
    	this.image = image;
    }

	public boolean isWater() {
		return isWater;
	}

	public void setWater(boolean isWater) {
		this.isWater = isWater;
	}
    
}
