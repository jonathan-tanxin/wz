package com.daxia.wz.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.daxia.wz.model.User;

@Component
public class MyAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication au) throws IOException, ServletException {
		if (au != null && au.getPrincipal() != null && au.getPrincipal() instanceof User) {
		    User user = (User) au.getPrincipal();
		    request.getSession().setAttribute("currentUser", user);
		    request.getSession().setAttribute("logined", true);
		}
		super.setDefaultTargetUrl("/admin/index");
		super.setAlwaysUseDefaultTargetUrl(true);

		super.onAuthenticationSuccess(request, response, au);
    }

}
