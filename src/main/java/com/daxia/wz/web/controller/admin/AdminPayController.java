package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.common.OrderStatus;
import com.daxia.wz.common.PayStatus;
import com.daxia.wz.dto.PayDTO;
import com.daxia.wz.service.PayService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/pay", produces="text/html;charset=UTF-8")
public class AdminPayController extends BaseController {

	@Autowired
	private PayService payService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			PayDTO dto = payService.load(id);
			map.put("n", dto);
		}
		return "admin/pay/pay_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('pay')")
	public String save(PayDTO dto) throws Exception {
		if (dto.getId() == null) {
			payService.create(dto);
		} else {
			//PayDTO old = payService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//payService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('pay')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		payService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(PayDTO dto, Map<String, Object> map, Page page) {
		List<PayDTO> dtos = payService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		map.put("statusList", PayStatus.values());
		return "admin/pay/pay_list";
	}
	
}
