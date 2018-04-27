package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.ProfitDetailDTO;
import com.daxia.wz.service.ProfitDetailService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/profitDetail", produces="text/html;charset=UTF-8")
public class AdminProfitDetailController extends BaseController {

	@Autowired
	private ProfitDetailService profitDetailService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			ProfitDetailDTO dto = profitDetailService.load(id);
			map.put("n", dto);
		}
		return "admin/profitDetail/profitDetail_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('profitDetail')")
	public String save(ProfitDetailDTO dto) throws Exception {
		if (dto.getId() == null) {
			profitDetailService.create(dto);
		} else {
			//ProfitDetailDTO old = profitDetailService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//profitDetailService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('profitDetail')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		profitDetailService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(ProfitDetailDTO dto, Map<String, Object> map, Page page) {
		List<ProfitDetailDTO> dtos = profitDetailService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/profitDetail/profitDetail_list";
	}
	
}
