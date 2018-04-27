package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.CustomerBalanceDetailDTO;
import com.daxia.wz.service.CustomerBalanceDetailService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/customerBalanceDetail", produces="text/html;charset=UTF-8")
public class AdminCustomerBalanceDetailController extends BaseController {

	@Autowired
	private CustomerBalanceDetailService customerBalanceDetailService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CustomerBalanceDetailDTO dto = customerBalanceDetailService.load(id);
			map.put("n", dto);
		}
		return "admin/customerBalanceDetail/customerBalanceDetail_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('customerBalanceDetail')")
	public String save(CustomerBalanceDetailDTO dto) throws Exception {
		if (dto.getId() == null) {
			customerBalanceDetailService.create(dto);
		} else {
			//CustomerBalanceDetailDTO old = customerBalanceDetailService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//customerBalanceDetailService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('customerBalanceDetail')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		customerBalanceDetailService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CustomerBalanceDetailDTO dto, Map<String, Object> map, Page page) {
		List<CustomerBalanceDetailDTO> dtos = customerBalanceDetailService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/customerBalanceDetail/customerBalanceDetail_list";
	}
	
}
