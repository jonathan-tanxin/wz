package com.daxia.wz.web.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.daxia.kwx.service.IWxService;
import com.daxia.wz.common.StatusCode;
import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.dto.UserDTO;
import com.daxia.wz.model.User;
import com.daxia.wz.service.AddressService;
import com.daxia.wz.service.BizConfigService;
import com.daxia.wz.service.CardService;
import com.daxia.wz.service.CategoryService;
import com.daxia.wz.service.CityService;
import com.daxia.wz.service.CoreService;
import com.daxia.wz.service.CourseService;
import com.daxia.wz.service.CustomerBalanceDetailService;
import com.daxia.wz.service.CustomerCardService;
import com.daxia.wz.service.CustomerService;
import com.daxia.wz.service.DishService;
import com.daxia.wz.service.DistributionCenterService;
import com.daxia.wz.service.DistrictService;
import com.daxia.wz.service.HealthCommentService;
import com.daxia.wz.service.HealthService;
import com.daxia.wz.service.MenuService;
import com.daxia.wz.service.OrderItemService;
import com.daxia.wz.service.OrderService;
import com.daxia.wz.service.PayService;
import com.daxia.wz.service.ProfitDetailService;
import com.daxia.wz.service.ProfitPhaseService;
import com.daxia.wz.service.ProfitService;
import com.daxia.wz.service.ProfitSetService;
import com.daxia.wz.service.ProvinceService;
import com.daxia.wz.service.RoleMenuService;
import com.daxia.wz.service.UserRoleService;
import com.daxia.wz.service.UserService;
import com.daxia.wz.util.DevUtils;
import com.daxia.wz.util.MyWebUtils;
import com.daxia.wz.util.SpringSecurityUtils;

public class BaseController extends CoreBaseController {
	@Autowired
	protected UserRoleService userRoleService;
	@Autowired
	protected IWxService iWxService;
	@Autowired
	protected RoleMenuService roleMenuService;
	@Autowired
	protected MenuService menuService;
	@Autowired
	protected ProfitSetService profitSetService;
	
    @Autowired
    protected ProfitPhaseService profitPhaseService;

    @Autowired
    protected ProfitDetailService profitDetailService;

    @Autowired
    protected HealthCommentService healthCommentService;

    @Autowired
    protected HealthService healthService;

    @Autowired
    protected ProfitService profitService;
    @Autowired
    private IWxService wxService;

    @Autowired
    protected CustomerBalanceDetailService customerBalanceDetailService;

	@Autowired
	protected CoreService coreService;
	
    @Autowired
    protected AddressService addressService;

    @Autowired
    protected PayService payService;

    @Autowired
    protected OrderItemService orderItemService;

    @Autowired
    protected OrderService orderService;

    @Autowired
    protected DistributionCenterService distributionCenterService;

    @Autowired
    protected CustomerCardService customerCardService;

    @Autowired
    protected CardService cardService;

    @Autowired
    protected DishService dishService;

    @Autowired
    protected CourseService courseService;

    @Autowired
    protected CategoryService categoryService;

    @Autowired
    protected CustomerService customerService;


	protected static Logger logger = Logger.getLogger(BaseController.class);

    @Autowired
    protected BizConfigService bizConfigService;

    @Autowired
    protected CityService cityService;

    @Autowired
    protected ProvinceService provinceService;

    @Autowired
    protected DistrictService districtService;

   
	@Autowired
	protected UserService userService;
	
    protected UserDTO getUserFromSession() {
        if (DevUtils.isLocal()) {
            return userService.load(13L);
        }
        UserDTO user = null;
        Long userIdFromSession = (Long) MyWebUtils.getCurrentRequest().getSession().getAttribute("wx.userId");
        if (userIdFromSession != null) {
            user = userService.load(userIdFromSession);
        }
        return user;
    }

    protected void setUserToSession(UserDTO user) {
        if (user != null) {
            MyWebUtils.getCurrentRequest().getSession().setAttribute("wx.userId", user.getId());
        }
    }
    
    protected String getRequestUrlWithQueryString() {
        String url = MyWebUtils.getCurrentRequest().getRequestURL().toString();
        String q = MyWebUtils.getCurrentRequest().getQueryString();
        if (StringUtils.isNotBlank(q)) {
            url += "?" + q;
        }
        return url;
    }
    
    @ResponseBody
    @ExceptionHandler
    public String onException(Exception e) {
    	logger.error(e.getMessage(), e);
    	JSONObject json = new JSONObject();
    	json.put("success", false);
    	json.put("msg", e.getMessage());
    	json.put("statusCode", StatusCode.ERROR.code());
		json.put("message", e.getMessage());
    	return json.toJSONString();
    }
    
    @ResponseBody
    public String okJson() {
    	JSONObject json = new JSONObject();
    	json.put("success", true);
    	return json.toJSONString();
    }
    
    protected UserDTO getCurrentUserDTO() {
    	User coreUser = SpringSecurityUtils.getCurrentUser();
    	if (coreUser == null) {
    		return null;
    	}
    	return userService.load(coreUser.getId());
    }

    protected CustomerDTO getCurrentCustomer() {
    	if (DevUtils.isLocal()) {
    		return customerService.load(30L);
    	}
    	CustomerDTO c = (CustomerDTO) MyWebUtils.getCurrentRequest().getSession().getAttribute("currentCustomer");
    	if (c != null) {
    		return customerService.load(c.getId());
    	}
    	return c;
    }
    
//    protected CustomerDTO getCurrentCustomer(String code) {
//    	CustomerDTO customerDTO = (CustomerDTO) MyWebUtils.getCurrentRequest().getSession().getAttribute("currentCustomer");
//    	if (customerDTO != null) {
//    		return customerDTO;
//    	}
//    	
//    	WxAuth wxAuth = wxService.auth(code);
//    	if (wxAuth.isSuccess()) {
//    		customerDTO = customerService.createFromWx(wxAuth);
//    		MyWebUtils.getCurrentRequest().getSession().setAttribute("currentCustomer", customerDTO);
//    	} else {
//    		logger.error(wxAuth.getErrorMessage());
//    	}
//    	return null;
//    	
//    }
}
