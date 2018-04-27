package com.daxia.wz.web.controller;

import java.lang.reflect.Method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.core.utils.JsonUtils;
import com.daxia.kwx.dto.OrderQueryResult;


@Controller
@RequestMapping(value = "test", produces="text/html;charset=UTF-8")
public class TestController extends BaseController {
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@ResponseBody
	@RequestMapping("rollback")
	public String rollback() throws Exception {
		systemConfigService.set2("a", "b");
		return ok();
	}
	
	@ResponseBody
	@RequestMapping("hello")
	public String hello(int age) throws Exception {
		System.out.println("hello...");
		return ok();
	}
	
	@ResponseBody
	@RequestMapping("queryOrder")
	public String queryOrder(String orderNo) throws Exception {
		OrderQueryResult result = iWxService.queryOrder(orderNo);
		return JsonUtils.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping("a")
	public String a() throws Exception {
		System.out.println("a...");
		Object obj = applicationContext.getBean("testController");
		Method[] methods = obj.getClass().getMethods();
		for (Method method : methods) {
			if ("queryOrder".equalsIgnoreCase(method.getName())) {
				method.invoke(obj, "1");
			}
		}
		return "a";
	}
	
	
}	
