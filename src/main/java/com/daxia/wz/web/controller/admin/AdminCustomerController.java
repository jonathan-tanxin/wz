package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.daxia.wz.model.Address;
import com.daxia.wz.service.AddressService;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.service.CustomerService;

import com.daxia.wz.support.Page;
import com.daxia.wz.util.ImageUtils;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/customer", produces="text/html;charset=UTF-8")
public class AdminCustomerController extends BaseController {

	@Autowired
	private CustomerService customerService;

	@Autowired
	private AddressService addressService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CustomerDTO dto = customerService.load(id);
			map.put("n", dto);
		}
		return "admin/customer/customer_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('customer')")
	public String save(CustomerDTO dto,HttpServletRequest request) throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String filePath = null;
		if(isMultipart){
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = multipartRequest.getFile("imageFile");
			if(file != null && !file.isEmpty()){
				//filePath = categoryService.upload
				filePath = ImageUtils.uploadToCDNAndGetUrl(file.getBytes());
				dto.setHeadImage(filePath);
			}
		}
		if (dto.getId() == null) {
			dto.setCreateTime(new Date());
			dto.setLastUpdateTime(new Date());
			dto.setIsdel(0);
			customerService.create(dto);
		} else {
			CustomerDTO old = customerService.load(dto.getId());
			old.setLastUpdateTime(new Date());
			old.setDishLeft(dto.getDishLeft());
			old.setHeadImage(dto.getHeadImage());
			old.setInviteCode(dto.getInviteCode());
			old.setIsDishMember(dto.getIsDishMember());
			old.setIsExpert(dto.getIsExpert());
			old.setIsWaterMember(dto.getIsWaterMember());
			old.setNickName(dto.getNickName());
			old.setWaterLeft(dto.getWaterLeft());
			customerService.updateAllFields(old);
			
		}
		return ok();
	}

    @PreAuthorize("hasRole('customer')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		customerService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CustomerDTO dto, Map<String, Object> map, Page page) {
		List<CustomerDTO> dtos = customerService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/customer/customer_list";
	}
	
	@RequestMapping(value = "/memberList")
	public String memberList(CustomerDTO dto, Map<String, Object> map, Page page) {
		dto.setIsDishMember(true);
		dto.setIsWaterMember(true);
		List<CustomerDTO> dtos = customerService.findMember(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/customer/member_list";
	}
	
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(Map<String, Object> map, Long id){
		if (id != null) {
			CustomerDTO dto = customerService.load(id);
			map.put("n", dto);
			Address address = addressService.findByCustomer(dto.getId());
			map.put("addr", address);
		}
		return "admin/customer/member_detail";
	}
	
	@RequestMapping(value = "/expertList")
	public String expertList(CustomerDTO dto, Map<String, Object> map, Page page) {
		dto.setIsDishMember(true);
		dto.setIsWaterMember(true);
		List<CustomerDTO> dtos = customerService.findExpert(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/customer/expert_list";
	}
	
	@RequestMapping(value = "/expertDetail")
	public String expertDetail(Map<String, Object> map, Long id){
		if (id != null) {
			CustomerDTO dto = customerService.load(id);
			map.put("n", dto);
		}
		return "admin/customer/expert_detail";
	}
	
}
