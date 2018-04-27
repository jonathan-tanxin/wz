package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.CustomerCardDTO;
import com.daxia.wz.service.CustomerCardService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/customerCard", produces="text/html;charset=UTF-8")
public class AdminCustomerCardController extends BaseController {

	@Autowired
	private CustomerCardService customerCardService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CustomerCardDTO dto = customerCardService.load(id);
			map.put("n", dto);
		}
		return "admin/customerCard/customerCard_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('customerCard')")
	public String save(CustomerCardDTO dto) throws Exception {
		if (dto.getId() == null) {
			customerCardService.create(dto);
		} else {
			//CustomerCardDTO old = customerCardService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//customerCardService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('customerCard')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		customerCardService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CustomerCardDTO dto, Map<String, Object> map, Page page) {
		List<CustomerCardDTO> dtos = customerCardService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/customerCard/customerCard_list";
	}
	
}
