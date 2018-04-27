package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.CityDTO;
import com.daxia.wz.dto.ProvinceDTO;
import com.daxia.wz.model.Province;
import com.daxia.wz.service.CityService;
import com.daxia.wz.service.ProvinceService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/city", produces="text/html;charset=UTF-8")
public class AdminCityController extends BaseController {

	@Autowired
	private CityService cityService;
	@Autowired
	private ProvinceService provinceService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CityDTO dto = cityService.load(id);
			map.put("n", dto);
		}
		return "admin/city/city_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	
	public String save(CityDTO dto) throws Exception {
		if (dto.getId() == null) {
			cityService.create(dto);
		} else {
				//用户将某个市设置为配送城市时，应当修改city的isHot=1，同时，如果city的省份的isHot为0，则改为1
				if (dto.getIsHot()) {
				ProvinceDTO pto = new ProvinceDTO();
				pto.setId(dto.getProvince().getId());
				pto.setLetter(dto.getProvince().getLetter());
				pto.setName(dto.getProvince().getName());
				pto.setIsHot(true);
				pto.setFullletter(dto.getProvince().getFullletter());
				provinceService.updateAllFields(pto);
				}else{
				//用户将某个市设置为非配送城市时，应该修改city的isHot=0，同时，寻找该city的省份下的其它城市中isHot有不为0的，否则将省份的isHot=0
					if (!cityService.hasHotProvinceByCity(dto.getProvince().getId())) {
						ProvinceDTO pto = new ProvinceDTO();
						pto.setId(dto.getProvince().getId());
						pto.setLetter(dto.getProvince().getLetter());
						pto.setName(dto.getProvince().getName());
						pto.setIsHot(false);
						pto.setFullletter(dto.getProvince().getFullletter());
						provinceService.updateAllFields(pto);	
					}
				}
				cityService.updateAllFields(dto);
		}
		return ok();
	}

    
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		cityService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CityDTO dto, Map<String, Object> map, Page page,Long provinceId) {
		if (provinceId == null) {
			List<CityDTO> dtos = cityService.find(dto, page);
			map.put("list", dtos);
			map.put("query", dto);
		}else{
			Province province = new Province();
			province.setId(provinceId);
			dto.setProvince(province);
			List<CityDTO> dtos = cityService.find(dto, page);
			map.put("list", dtos);
			map.put("query", dto);
		}
		return "admin/city/city_list";
	}
	
}
