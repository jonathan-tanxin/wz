package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DistributionCenter
 */
@Entity
@Table(name = "distributioncenter") 
public class DistributionCenter extends BaseModel {
	
	public DistributionCenter() {
	}
	
	public DistributionCenter(Long id) {
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
	 * 关联负责人
	 */
	@ManyToOne
	@JoinColumn(name = "customer_id")
    private Customer customer;
	/**
	 * 名称
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 地址
	 */
	@Column(name = "address")
    private String address;
	/**
	 * 负责人
	 */
	@Column(name = "leader")
    private String leader;
	/**
	 * 电话
	 */
	@Column(name = "mobile")
    private String mobile;
	
	@Column(name = "isdel")
	private Integer isdel;
	
	/**
	 * 如果为0则表示该配送中心在该城市中是不分区域进行配送
	 */
	@ManyToOne
	@JoinColumn(name = "district_id")
    private District district;
	
	/**
	 * 配送中心所在省份
	 */
	@ManyToOne
	@JoinColumn(name = "province_id")
    private Province province;
	
	/**
	 * 配送中心所在城市
	 */
	@ManyToOne
	@JoinColumn(name = "city_id")
    private City city;
	
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
	
	public Customer getCustomer() {
    	return customer;
    }
	
    public void setCustomer(Customer customer) {
    	this.customer = customer;
    }
	
	public String getName() {
    	return name;
    }
	
    public void setName(String name) {
    	this.name = name;
    }
	
	public String getAddress() {
    	return address;
    }
	
    public void setAddress(String address) {
    	this.address = address;
    }
	
	public String getLeader() {
    	return leader;
    }
	
    public void setLeader(String leader) {
    	this.leader = leader;
    }
	
	public String getMobile() {
    	return mobile;
    }
	
    public void setMobile(String mobile) {
    	this.mobile = mobile;
    }

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}
	
	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

}
