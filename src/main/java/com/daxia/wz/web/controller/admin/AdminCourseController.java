package com.daxia.wz.web.controller.admin;

import java.io.IOException;
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

import com.daxia.wz.dto.CourseDTO;
import com.daxia.wz.service.CourseService;

import com.daxia.wz.support.Page;
import com.daxia.wz.util.ImageUtils;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/course", produces="text/html;charset=UTF-8")
public class AdminCourseController extends BaseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CourseDTO dto = courseService.load(id);
			map.put("n", dto);
		}
		return "admin/course/course_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('course')")
	public String save(CourseDTO dto,HttpServletRequest request) throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String filePath = null;
		if(isMultipart){
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = multipartRequest.getFile("imageFile");
			if(file != null && !file.isEmpty()){
				//filePath = categoryService.upload
				filePath = ImageUtils.uploadToCDNAndGetUrl(file.getBytes());
				dto.setImage(filePath);
			}
		}
		if (dto.getId() == null) {
			dto.setIsdel(0);
			courseService.create(dto);
		} else {
			CourseDTO old = courseService.load(dto.getId());
			old.setDate(dto.getDate());
			old.setHost(dto.getHost());
			old.setHref(dto.getHref());
			old.setImage(dto.getImage());
			old.setStatus(dto.getStatus());
			old.setTitle(dto.getTitle());
			courseService.updateAllFields(old);
			
		}
		return ok();
	}

    @PreAuthorize("hasRole('course')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		courseService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CourseDTO dto, Map<String, Object> map, Page page) {
		List<CourseDTO> dtos = courseService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/course/course_list";
	}
	
}
