package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.AddressDTO;
import com.daxia.wz.service.AddressService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/address", produces="text/html;charset=UTF-8")
public class AdminAddressController extends BaseController {

	@Autowired
	private AddressService addressService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			AddressDTO dto = addressService.load(id);
			map.put("n", dto);
		}
		return "admin/address/address_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('address')")
	public String save(AddressDTO dto) throws Exception {
		if (dto.getId() == null) {
			addressService.create(dto);
		} else {
			//AddressDTO old = addressService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//addressService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('address')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		addressService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(AddressDTO dto, Map<String, Object> map, Page page) {
		List<AddressDTO> dtos = addressService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/address/address_list";
	}
	
}
