package com.daxia.wz.dto;

import com.daxia.wz.model.User;

public class UserDTO extends User {
	private String searchTerm;

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}
	
}
