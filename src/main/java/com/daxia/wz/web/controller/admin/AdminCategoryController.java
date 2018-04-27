package com.daxia.wz.web.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.dto.CategoryDTO;
import com.daxia.wz.service.CategoryService;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.ImageUtils;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/category", produces="text/html;charset=UTF-8")
public class AdminCategoryController extends BaseController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CategoryDTO dto = categoryService.load(id);
			map.put("n", dto);
		}
		return "admin/category/category_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('category')")
	public String save(CategoryDTO dto,HttpServletRequest request) throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String filePath = null;
		if(isMultipart){
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = multipartRequest.getFile("file");
			if(file != null && !file.isEmpty()){
				//filePath = categoryService.upload
				filePath = ImageUtils.uploadToCDNAndGetUrl(file.getBytes());
				dto.setImage(filePath);
			}
		}
		if (dto.getId() == null) {
			dto.setIsdel(0);
			categoryService.create(dto);
		} else {
			CategoryDTO old = categoryService.load(dto.getId());
			old.setImage(dto.getImage());
			old.setName(dto.getName());
			old.setWater(dto.isWater());
			categoryService.updateAllFields(old);
		}
		return ok();
	}

    @PreAuthorize("hasRole('category')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		categoryService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CategoryDTO dto, Map<String, Object> map, Page page) {
		List<CategoryDTO> dtos = categoryService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/category/category_list";
	}
	
	
	@RequestMapping(value = "/queryList")
	@ResponseBody
	public String queryList(CategoryDTO dto){
		List<CategoryDTO> list = categoryService.find(dto, null);
		JSONObject json = new JSONObject();
		json.put("list", list);
		return json.toJSONString();
	}
	
}
