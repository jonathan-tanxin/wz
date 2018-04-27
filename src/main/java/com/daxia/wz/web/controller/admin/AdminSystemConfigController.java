package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.common.Log;
import com.daxia.wz.common.LogModule;
import com.daxia.wz.common.Module;
import com.daxia.wz.dto.SystemConfigDTO;
import com.daxia.wz.service.SystemConfigService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.CoreBaseController;

@Module(name=LogModule.SystemConfig)
@Controller
@RequestMapping(value = "/admin/systemConfig", produces="text/html;charset=UTF-8") // produces是为了解决@ResponseBody返回乱码
public class AdminSystemConfigController extends CoreBaseController {

	@Autowired
	private SystemConfigService systemConfigService;
	
	
	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, String key) {
		map.put("n", systemConfigService.findByKey(key));
		return "admin/systemConfig/systemConfig_detail";
	}
	
	/**
	 * 如果dto.getId不为空，则为更新，如果为空，则是保存.
	 * @ResponseBody 表示这是一个接收json请求的方式，返回值 不会跳转到哪个页面，返回值为void。
	 * 要传给页面的json值，请调用父类BaseController提供的三个方法。
	 * @param dto
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public String save(Long id, String value) throws Exception {
		SystemConfigDTO old = systemConfigService.load(id);
		old.setValue(value);
		systemConfigService.updateAllFields(old);
		return ok();
	}

    @Log(operation = "删除系统参数")
    
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		systemConfigService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	
	public String list(SystemConfigDTO dto, Map<String, Object> map, Page page) {
		List<SystemConfigDTO> dtos = systemConfigService.find(dto, page);
		// 这个数据是用来展示的
		map.put("systemConfigs", dtos);
		// 这个数据是保存查询条件的
		map.put("systemConfig", dto);
		return "admin/core/systemConfig/systemConfig_list";
	}
	
}
