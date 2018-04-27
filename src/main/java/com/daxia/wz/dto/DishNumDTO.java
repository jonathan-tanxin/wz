package com.daxia.wz.dto;

public class DishNumDTO {
	private long id;
	private int num;
	
	public DishNumDTO(long id, int num) {
		super();
		this.id = id;
		this.num = num;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
