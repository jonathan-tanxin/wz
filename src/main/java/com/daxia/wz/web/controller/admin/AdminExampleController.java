package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.ExampleDTO;
import com.daxia.wz.service.ExampleService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/example", produces="text/html;charset=UTF-8")
public class AdminExampleController extends BaseController {

	@Autowired
	private ExampleService exampleService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			ExampleDTO dto = exampleService.load(id);
			map.put("n", dto);
		}
		return "admin/example/example_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	
	public String save(ExampleDTO dto) throws Exception {
		if (dto.getId() == null) {
			exampleService.create(dto);
		} else {
			exampleService.updateAllFields(dto);
		}
		return ok();
	}

    
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		exampleService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	
	public String list(ExampleDTO dto, Map<String, Object> map, Page page) {
		List<ExampleDTO> dtos = exampleService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/example/example_list";
	}
	
}
