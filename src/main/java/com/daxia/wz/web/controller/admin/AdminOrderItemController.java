package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.OrderItemDTO;
import com.daxia.wz.service.OrderItemService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/orderItem", produces="text/html;charset=UTF-8")
public class AdminOrderItemController extends BaseController {

	@Autowired
	private OrderItemService orderItemService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			OrderItemDTO dto = orderItemService.load(id);
			map.put("n", dto);
		}
		return "admin/orderItem/orderItem_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('orderItem')")
	public String save(OrderItemDTO dto) throws Exception {
		if (dto.getId() == null) {
			orderItemService.create(dto);
		} else {
			//OrderItemDTO old = orderItemService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//orderItemService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('orderItem')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		orderItemService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(OrderItemDTO dto, Map<String, Object> map, Page page) {
		List<OrderItemDTO> dtos = orderItemService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/orderItem/orderItem_list";
	}
	
}
