package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.daxia.wz.dto.CategoryDTO;
import com.daxia.wz.dto.DishDTO;
import com.daxia.wz.service.CategoryService;
import com.daxia.wz.service.DishService;

import com.daxia.wz.support.Page;
import com.daxia.wz.util.ImageUtils;
import com.daxia.wz.util.QiniuUtils;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/dish", produces="text/html;charset=UTF-8")
public class AdminDishController extends BaseController {

	@Autowired
	private DishService dishService;
	
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			DishDTO dto = dishService.load(id);
			//将dto的图片地址修改为带授权签字的图片地址
			dto.setImages(QiniuUtils.download(dto.getImages()));
			dto.setListImage(QiniuUtils.download(dto.getListImage()));
			map.put("n", dto);
		}
		return "admin/dish/dish_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('dish')")
	public String save(DishDTO dto,HttpServletRequest request) throws Exception {
		
		if (dto.getId() == null) {
			dto.setCreateTime(new Date());
			dto.setIsdel(0);
			dishService.create(dto);
		} else {
			DishDTO old = dishService.load(dto.getId());
			//CategoryDTO category = categoryService.load(dto.getCategory().getId());
					
			//old.setCategory(category);
			old.setCategory(dto.getCategory());
			old.setImages(dto.getImages());
			old.setListImage(dto.getListImage());
			old.setUnit(dto.getUnit());
			old.setTotalSold(dto.getTotalSold());
			old.setStock(dto.getStock());
			old.setStars(dto.getStars());
			old.setName(dto.getName());
			old.setMonthSold(dto.getMonthSold());
			old.setIsCustomerOwner(dto.getIsCustomerOwner());
			old.setPrice(dto.getPrice());
			old.setDishDesc(dto.getDishDesc());
			//old.setLimited(dto.isLimited());
			dishService.updateAllFields(old);
			
		}
		return ok();
	}

    @PreAuthorize("hasRole('dish')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		dishService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(DishDTO dto, Map<String, Object> map, Page page) {
		List<DishDTO> dtos = dishService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/dish/dish_list";
	}
	
}
