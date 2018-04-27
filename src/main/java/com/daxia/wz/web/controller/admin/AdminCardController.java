package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.dto.CardDTO;
import com.daxia.wz.service.CardService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/card", produces="text/html;charset=UTF-8")
public class AdminCardController extends BaseController {

	@Autowired
	private CardService cardService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			CardDTO dto = cardService.load(id);
			map.put("n", dto);
		}
		return "admin/card/card_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('card')")
	public String save(CardDTO dto) throws Exception {
		if (dto.getId() == null) {
			dto.setIsdel(0);
			cardService.create(dto);
		} else {
			CardDTO old = cardService.load(dto.getId());
			 old.setName(dto.getName());
			 old.setDescription(dto.getDescription());
			 old.setMoney(dto.getMoney());
			 old.setAmount(dto.getAmount());
			 old.setType(dto.getType());
			 old.setMonths(dto.getMonths());
			 
			cardService.updateAllFields(old);
		}
		return ok();
	}

    @PreAuthorize("hasRole('card')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		cardService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(CardDTO dto, Map<String, Object> map, Page page) {
		List<CardDTO> dtos = cardService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/card/card_list";
	}
	
}
