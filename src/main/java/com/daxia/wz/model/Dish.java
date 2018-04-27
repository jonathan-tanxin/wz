package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import org.springframework.format.annotation.DateTimeFormat;
import com.daxia.wz.model.Category;
import java.util.Date;
import javax.persistence.JoinColumn;

/**
 * Dish
 */
@Entity
@Table(name = "dish") 
public class Dish extends BaseModel {
	
	public Dish() {
	}
	
	public Dish(Long id) {
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
	 * 菜品类别
	 */
	@ManyToOne
	@JoinColumn(name = "category_id")
    private Category category;
	/**
	 * 菜品名
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 单位
	 */
	@Column(name = "unit")
    private String unit;
	/**
	 * 库存
	 */
	@Column(name = "stock")
    private Double stock;
	/**
	 * 列表页的图片
	 */
	@Column(name = "listImage")
    private String listImage;
	/**
	 * 图片
	 */
	@Column(name = "images")
    private String images;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 星级
	 */
	@Column(name = "stars")
    private Integer stars;
	/**
	 * 总销量
	 */
	@Column(name = "totalSold")
    private Integer totalSold;
	/**
	 * 月销量
	 */
	@Column(name = "monthSold")
    private Integer monthSold;
	
	/**
	 * 价格
	 */
	@Column(name = "price")
	private Double price;
	
	@Column(name = "isdel")
	private Integer isdel;
	
	/**
	 * 是否属于会员
	 */
	@Column(name = "isCustomerOwner")
    private Boolean isCustomerOwner;

	@Column(name = "dishDesc")
	private String dishDesc;
	
	public Boolean getIsCustomerOwner() {
		return isCustomerOwner;
	}

	public void setIsCustomerOwner(Boolean isCustomerOwner) {
		this.isCustomerOwner = isCustomerOwner;
	}

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
	
	public Category getCategory() {
    	return category;
    }
	
    public void setCategory(Category category) {
    	this.category = category;
    }
	
	public String getName() {
    	return name;
    }
	
    public void setName(String name) {
    	this.name = name;
    }
	
	public String getUnit() {
    	return unit;
    }
	
    public void setUnit(String unit) {
    	this.unit = unit;
    }
	
	public Double getStock() {
    	return stock;
    }
	
    public void setStock(Double stock) {
    	this.stock = stock;
    }
	
	public String getListImage() {
    	return listImage;
    }
	
    public void setListImage(String listImage) {
    	this.listImage = listImage;
    }
	
	public String getImages() {
    	return images;
    }
	
    public void setImages(String images) {
    	this.images = images;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public Integer getStars() {
    	return stars;
    }
	
    public void setStars(Integer stars) {
    	this.stars = stars;
    }
	
	public Integer getTotalSold() {
    	return totalSold;
    }
	
    public void setTotalSold(Integer totalSold) {
    	this.totalSold = totalSold;
    }
	
	public Integer getMonthSold() {
    	return monthSold;
    }
	
    public void setMonthSold(Integer monthSold) {
    	this.monthSold = monthSold;
    }

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getDishDesc() {
		return dishDesc;
	}

	public void setDishDesc(String dishDesc) {
		this.dishDesc = dishDesc;
	}
	
}
