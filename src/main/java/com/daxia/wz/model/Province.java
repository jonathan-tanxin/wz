package com.daxia.wz.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * Province
 */
@Entity
@Table(name = "province") 
public class Province extends BaseModel {
	/**
	 * id
	 */
	@Id
	@GeneratedValue
	@Column(name = "id")
    private Long id;
	/**
	 * 名称
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 字母
	 */
	@Column(name = "letter")
    private String letter;
	/**
	 * 是否是热门城市
	 */
	@Column(name = "isHot")
    private Boolean isHot;
	/**
	 * 全拼音
	 */
	@Column(name = "fullletter")
    private String fullletter;
	
	@OneToMany(mappedBy = "province")
	private List<City> citys;
	
	
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
	
	public String getLetter() {
    	return letter;
    }
	
    public void setLetter(String letter) {
    	this.letter = letter;
    }
	
	public Boolean getIsHot() {
    	return isHot;
    }
	
    public void setIsHot(Boolean isHot) {
    	this.isHot = isHot;
    }
	
	public String getFullletter() {
    	return fullletter;
    }
	
    public void setFullletter(String fullletter) {
    	this.fullletter = fullletter;
    }

	public List<City> getCitys() {
		return citys;
	}

	public void setCitys(List<City> citys) {
		this.citys = citys;
	}
	
}
