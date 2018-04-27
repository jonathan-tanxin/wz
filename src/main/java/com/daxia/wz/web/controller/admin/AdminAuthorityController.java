package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.common.Log;
import com.daxia.wz.dto.AuthorityDTO;
import com.daxia.wz.service.AuthorityService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.CoreBaseController;

@Controller
@RequestMapping(value = "/admin/authority", produces="text/html;charset=UTF-8")
public class AdminAuthorityController extends CoreBaseController {

	/**
	 * @Autowired 表示自动注入spring管理的bean，不需要写getter和setter就能注入
	 */
	@Autowired
	private AuthorityService authorityService;
	
	/**
	 * map是用来传值 ，在页面通过${key}的方式就能得到值 。比如map里put("authority", dto)，在页面取就是${authority.id}这种。
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			AuthorityDTO dto = authorityService.load(id);
			map.put("authority", dto);
		}
		return "admin/authority/authority_detail";
	}
	
	/**
	 * 如果dto.getId不为空，则为更新，如果为空，则是保存.
	 * @ResponseBody 表示这是一个接收json请求的方式，返回值 不会跳转到哪个页面，返回值为void。
	 * 要传给页面的json值，请调用父类BaseController提供的三个方法。
	 * @param dto
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	@Log(operation = "保存权限")
	public String save(HttpServletRequest request, HttpServletResponse response, AuthorityDTO dto) throws IOException {
		if (dto.getId() == null) {
			authorityService.save(dto);
		} else {
			authorityService.update(dto);
		}
		return ok();
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(HttpServletResponse response, Long[] ids) throws IOException {
		authorityService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(AuthorityDTO dto, Map<String, Object> map, Page page) {
		List<AuthorityDTO> dtos = authorityService.listTops();
		map.put("authorities", dtos);
		map.put("authority", dto);
		return "admin/authority/authority_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchAuthority")
	public String searchAuthority(HttpServletResponse response, String name) throws IOException {
		List<AuthorityDTO> authorityDTOs = authorityService.list(new AuthorityDTO(), null);
		JSONArray array = new JSONArray();
		for (AuthorityDTO dto : authorityDTOs) {
            JSONObject obj = new JSONObject();
            obj.put("id", dto.getId());
            obj.put("name", dto.getName());
            array.add(obj);
        }
		return array.toJSONString();
	}
	
}
