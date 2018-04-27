package com.daxia.wz.dto;

import java.util.ArrayList;
import java.util.List;

import com.daxia.wz.model.HealthComment;

public class HealthChartDTO {
	private CustomerDTO customer;
	private String days;
	private String xhdbArr;
	private String xzgArr;
	private String szyArr;
	private String ssyArr;
	private List<HealthComment> comments = new ArrayList<>();
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getXhdbArr() {
		return xhdbArr;
	}
	public void setXhdbArr(String xhdbArr) {
		this.xhdbArr = xhdbArr;
	}
	public String getXzgArr() {
		return xzgArr;
	}
	public void setXzgArr(String xzgArr) {
		this.xzgArr = xzgArr;
	}
	public CustomerDTO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerDTO customer) {
		this.customer = customer;
	}
	public List<HealthComment> getComments() {
		return comments;
	}
	public void setComments(List<HealthComment> comments) {
		this.comments = comments;
	}
	public String getSzyArr() {
		return szyArr;
	}
	public void setSzyArr(String szyArr) {
		this.szyArr = szyArr;
	}
	public String getSsyArr() {
		return ssyArr;
	}
	public void setSsyArr(String ssyArr) {
		this.ssyArr = ssyArr;
	}
	
	
}
