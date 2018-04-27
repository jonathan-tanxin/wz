package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.ProfitPhaseDTO;
import com.daxia.wz.service.ProfitPhaseService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/profitPhase", produces="text/html;charset=UTF-8")
public class AdminProfitPhaseController extends BaseController {

	@Autowired
	private ProfitPhaseService profitPhaseService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			ProfitPhaseDTO dto = profitPhaseService.load(id);
			map.put("n", dto);
		}
		return "admin/profitPhase/profitPhase_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('profitPhase')")
	public String save(ProfitPhaseDTO dto) throws Exception {
		if (dto.getId() == null) {
			profitPhaseService.create(dto);
		} else {
			//ProfitPhaseDTO old = profitPhaseService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//profitPhaseService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('profitPhase')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		profitPhaseService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(ProfitPhaseDTO dto, Map<String, Object> map, Page page) {
		List<ProfitPhaseDTO> dtos = profitPhaseService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/profitPhase/profitPhase_list";
	}
	
}
