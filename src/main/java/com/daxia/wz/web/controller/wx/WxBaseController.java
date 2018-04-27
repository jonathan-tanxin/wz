package com.daxia.wz.web.controller.wx;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.daxia.core.exception.BizException;
import com.daxia.kwx.dto.WxAuth;
import com.daxia.kwx.service.IWxService;
import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.util.MyWebUtils;
import com.daxia.wz.web.controller.BaseController;

public class WxBaseController extends BaseController {
	@Autowired
	protected IWxService wxService;
	
	protected String getRequestUrlWithQueryString() {
        String url = MyWebUtils.getCurrentRequest().getRequestURL().toString();
        String q = MyWebUtils.getCurrentRequest().getQueryString();
        if (StringUtils.isNotBlank(q)) {
            url += "?" + q;
        }
        return url;
    }
	
	protected void title(String title) {
		MyWebUtils.getCurrentRequest().setAttribute("title", title);
	}
	/*
	protected void setCustomerToSession(CustomerDTO customer) {
		MyWebUtils.getCurrentRequest().getSession().setAttribute("wxuser", customer);
	}
	
	protected CustomerDTO getCustomerFromSession() {
		return (CustomerDTO) MyWebUtils.getCurrentRequest().getSession().getAttribute("wxuser");
	} */

	/**
	 * 检查授权，如果没有就去授权
	 * @param code
	 */
	public void checkAuth(String code) {
		this.checkAuth(code, null);
	}
	public void checkAuth(String code, Long inviteCustomerId) {
		CustomerDTO customerDTO = getCurrentCustomer();
		if (customerDTO != null) {
			return;
		}
		
		WxAuth wxAuth = wxService.auth(code);
		if (wxAuth == null) {
			throw new BizException("授权失败");
		}
		if (!wxAuth.isSuccess()) {
			throw new BizException("授权失败, " + wxAuth.getErrorMessage());
		}
		
		customerDTO = customerService.findByOpenid(wxAuth.getOpenid());
		if (customerDTO != null) {
			setCustomerToSession(customerDTO);
			return;
		}
		
		customerDTO = customerService.createFromWx(wxAuth, inviteCustomerId);
		setCustomerToSession(customerDTO);
	}

	private void setCustomerToSession(CustomerDTO customerDTO) {
		MyWebUtils.getCurrentRequest().getSession().setAttribute("currentCustomer", customerDTO);		
	}
}
