package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.dto.DistributionCenterDTO;
import com.daxia.wz.model.District;
import com.daxia.wz.service.DistributionCenterService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/distributionCenter", produces="text/html;charset=UTF-8")
public class AdminDistributionCenterController extends BaseController {

	@Autowired
	private DistributionCenterService distributionCenterService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			DistributionCenterDTO dto = distributionCenterService.load(id);
			map.put("n", dto);
		}
		List<CustomerDTO> customerList = customerService.findAll();
		map.put("customerList", customerList);
		map.put("provinces", provinceService.findAll());
		return "admin/distributionCenter/distributionCenter_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('distributionCenter')")
	public String save(DistributionCenterDTO dto) throws Exception {
		if (dto.getId() == null) {
			dto.setIsdel(0);
			if (dto.getDistrict() != null && dto.getDistrict().getId() == null) {
				dto.setDistrict(null);
			}
			distributionCenterService.create(dto);
		} else {
			DistributionCenterDTO old = distributionCenterService.load(dto.getId());
			old.setAddress(dto.getAddress());
			old.setCustomer(dto.getCustomer());
			old.setLeader(dto.getLeader());
			old.setMobile(dto.getMobile());
			old.setName(dto.getName());
			old.setProvince(dto.getProvince());
			old.setCity(dto.getCity());
			old.setCity(dto.getCity());
			if (old.getDistrict() != null && old.getDistrict().getId() == null) {
				old.setDistrict(null);
			}
			distributionCenterService.updateAllFields(old);
			
		}
		return ok();
	}

    @PreAuthorize("hasRole('distributionCenter')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		distributionCenterService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(DistributionCenterDTO dto, Map<String, Object> map, Page page) {
		List<DistributionCenterDTO> dtos = distributionCenterService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/distributionCenter/distributionCenter_list";
	}
	
}
