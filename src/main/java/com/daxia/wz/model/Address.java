package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import javax.persistence.ManyToOne;
import com.daxia.wz.model.District;
import com.daxia.wz.model.Province;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.DistributionCenter;
import com.daxia.wz.model.City;

/**
 * Address
 */
@Entity
@Table(name = "address") 
public class Address extends BaseModel {
	
	public Address() {
	}
	
	public Address(Long id) {
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
	 * 联系人
	 */
	@Column(name = "name")
    private String name;
	/**
	 * 联系电话
	 */
	@Column(name = "mobile")
    private String mobile;
	/**
	 * 地址
	 */
	@Column(name = "address")
    private String address;
	/**
	 * 省
	 */
	@ManyToOne
	@JoinColumn(name = "province_id")
    private Province province;
	/**
	 * 城市
	 */
	@ManyToOne
	@JoinColumn(name = "city_id")
    private City city;
	/**
	 * 地区
	 */
	@ManyToOne
	@JoinColumn(name = "district_id")
    private District district;
	/**
	 * 配送中心
	 */
	@ManyToOne
	@JoinColumn(name = "distributionCenter_id")
    private DistributionCenter distributionCenter;
	
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
	
	public String getMobile() {
    	return mobile;
    }
	
    public void setMobile(String mobile) {
    	this.mobile = mobile;
    }
	
	public String getAddress() {
    	return address;
    }
	
    public void setAddress(String address) {
    	this.address = address;
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
	
	public District getDistrict() {
    	return district;
    }
	
    public void setDistrict(District district) {
    	this.district = district;
    }
	
	public DistributionCenter getDistributionCenter() {
    	return distributionCenter;
    }
	
    public void setDistributionCenter(DistributionCenter distributionCenter) {
    	this.distributionCenter = distributionCenter;
    }
	
}
