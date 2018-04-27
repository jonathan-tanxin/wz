package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import java.math.BigDecimal;

/**
 * Card
 */
@Entity
@Table(name = "card") 
public class Card extends BaseModel {
	
	public Card() {
	}
	
	public Card(Long id) {
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
	 * 会员卡名称
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 描述
	 */
	@Column(name = "description")
    private String description;
	/**
	 * 类型，1购菜，2购水
	 */
	@Column(name = "type")
    private Integer type;
	/**
	 * 月数（6个月，1年）
	 */
	@Column(name = "months")
    private Integer months;
	/**
	 * 购卡金额
	 */
	@Column(name = "money")
    private BigDecimal money;
	/**
	 * 购菜斤数
	 */
	@Column(name = "amount")
    private Double amount;
	
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
	
	public String getDescription() {
    	return description;
    }
	
    public void setDescription(String description) {
    	this.description = description;
    }
	
	public Integer getType() {
    	return type;
    }
	
    public void setType(Integer type) {
    	this.type = type;
    }
	
	public Integer getMonths() {
    	return months;
    }
	
    public void setMonths(Integer months) {
    	this.months = months;
    }
	
	public BigDecimal getMoney() {
	    return moneyValue(money);
    }
	
    public void setMoney(BigDecimal money) {
    	this.money = money;
    }
	
	public Double getAmount() {
    	return amount;
    }
	
    public void setAmount(Double amount) {
    	this.amount = amount;
    }
	
}
