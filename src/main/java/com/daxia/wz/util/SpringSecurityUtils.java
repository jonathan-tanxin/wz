package com.daxia.wz.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.daxia.wz.model.User;

public class SpringSecurityUtils {
	
	public static User getCurrentUser() {
		Authentication au = SecurityContextHolder.getContext().getAuthentication();
		if (au != null && au.getPrincipal() != null && au.getPrincipal() instanceof User) {
			User user = (User) au.getPrincipal();
			return user;
		}
		return null;
	}

}
