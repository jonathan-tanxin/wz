package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.HealthCommentDTO;
import com.daxia.wz.service.HealthCommentService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/healthComment", produces="text/html;charset=UTF-8")
public class AdminHealthCommentController extends BaseController {

	@Autowired
	private HealthCommentService healthCommentService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			HealthCommentDTO dto = healthCommentService.load(id);
			map.put("n", dto);
		}
		return "admin/healthComment/healthComment_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('healthComment')")
	public String save(HealthCommentDTO dto) throws Exception {
		if (dto.getId() == null) {
			healthCommentService.create(dto);
		} else {
			//HealthCommentDTO old = healthCommentService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//healthCommentService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}

    @PreAuthorize("hasRole('healthComment')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		healthCommentService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(HealthCommentDTO dto, Map<String, Object> map, Page page) {
		List<HealthCommentDTO> dtos = healthCommentService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/healthComment/healthComment_list";
	}
	
}
