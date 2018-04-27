package com.daxia.wz.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.daxia.wz.dto.UserDTO;
import com.daxia.wz.model.User;
import com.daxia.wz.test.BaseTest;

public class UserDAOTest extends BaseTest {

	@Autowired
	UserDAO userDAO;
	
	@Test
	public void testFindOneUserDTO() {
		UserDTO dto = new UserDTO();
		dto.setId(1L);
		User user = userDAO.findOne(dto);
		
		assertEquals("username", "admin", user.getUsername());
	}

}
