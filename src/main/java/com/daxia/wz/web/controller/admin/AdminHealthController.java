package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.HealthDTO;
import com.daxia.wz.service.HealthService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/health", produces="text/html;charset=UTF-8")
public class AdminHealthController extends BaseController {

	@Autowired
	private HealthService healthService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			HealthDTO dto = healthService.load(id);
			map.put("n", dto);
		}
		return "admin/health/health_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('health')")
	public String save(HealthDTO dto) throws Exception {
		if (dto.getId() == null) {
			healthService.create(dto);
		} else {
			//HealthDTO old = healthService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//healthService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('health')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		healthService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(HealthDTO dto, Map<String, Object> map, Page page) {
		List<HealthDTO> dtos = healthService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/health/health_list";
	}
	
}
