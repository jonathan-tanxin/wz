package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.common.Log;
import com.daxia.wz.common.LogModule;
import com.daxia.wz.common.MenuLevels;
import com.daxia.wz.common.Module;
import com.daxia.wz.dto.MenuDTO;
import com.daxia.wz.service.MenuService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.CoreBaseController;

@Controller
@RequestMapping(value = "/admin/menu", produces="text/html;charset=UTF-8")
@Module(name = LogModule.Menu)
public class AdminMenuController extends CoreBaseController {

	/**
	 * @Autowired 表示自动注入spring管理的bean，不需要写getter和setter就能注入
	 */
	@Autowired
	private MenuService menuService;
	
	/**
	 * map是用来传值 ，在页面通过${key}的方式就能得到值 。比如map里put("menu", dto)，在页面取就是${menu.id}这种。
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			MenuDTO dto = menuService.load(id);
			map.put("n", dto);
			if (dto.getLevel() == MenuLevels.Level2.level()) {
				// load出所有的一级菜单
				map.put("parentLevelMenus", menuService.loadByLevel(MenuLevels.Level1));
			} else if (dto.getLevel() == MenuLevels.Level1.level()) {
				map.put("parentLevelMenus", menuService.loadByLevel(MenuLevels.Level0));
			}
		}
		map.put("parents", menuService.loadByLevel(MenuLevels.Level1));
		return "admin/menu/menu_detail";
	}
	
	/**
	 * 如果dto.getId不为空，则为更新，如果为空，则是保存.
	 * @ResponseBody 表示这是一个接收json请求的方式，返回值 不会跳转到哪个页面，返回值为void。
	 * 要传给页面的json值，请调用父类BaseController提供的三个方法。
	 * @param dto
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public String save(HttpServletResponse response, MenuDTO dto) throws IOException {
		if (dto.getParent() != null && dto.getParent().getId() != null) {
			dto.setLevel(MenuLevels.Level2.level());
		} else {
			dto.setLevel(MenuLevels.Level1.level());
		}
		
		if (dto.getAuthority() != null && dto.getAuthority().getId() == null) {
			dto.setAuthority(null);
		}
		if (dto.getParent() != null && dto.getParent().getId() == null) {
			dto.setParent(menuService.load(6L));
		}
		
		if (dto.getId() == null) {
			menuService.save(dto);
		} else {
		    MenuDTO old = menuService.load(dto.getId());
		    old.setName(dto.getName());
		    old.setHref(dto.getHref());
		    old.setParent(dto.getParent());
		    old.setSeq(dto.getSeq());
		    old.setShow(dto.getShow());
		    old.setAuthority(dto.getAuthority());
			menuService.updateAllField(old);
		}
		return ok();
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete") 
	@Log(operation = "删除菜单")
	public String delete(HttpServletResponse response, Long[] ids) throws IOException {
		menuService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(MenuDTO dto, Map<String, Object> map, Page page) {
		List<MenuDTO> dtos = menuService.list(dto, null);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/menu/menu_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/find")
	public void find() {
		
	}

	@ResponseBody
    @RequestMapping(value = "/findParent")
    public String searchChildren(HttpServletResponse response, Integer level) throws IOException {
        MenuDTO dto = new MenuDTO();
        dto.setLevel(level - 1);
        List<MenuDTO> menus = menuService.list(dto, null);
        JSONArray array = new JSONArray();
        for (MenuDTO menu : menus) {
            JSONObject json = new JSONObject();
            json.put("id", menu.getId());
            json.put("name", menu.getName());
            array.add(json);
        }
        return array.toJSONString();
    }
}
