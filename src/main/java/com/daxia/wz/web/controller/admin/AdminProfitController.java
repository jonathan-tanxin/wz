package com.daxia.wz.web.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.daxia.wz.dto.ProfitSetDTO;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.service.ProfitSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.core.exception.BizException;
import com.daxia.kwx.dto.WxPayUser;
import com.daxia.wz.common.ProfitPhaseStatus;
import com.daxia.wz.dto.ProfitDTO;
import com.daxia.wz.dto.ProfitPhaseDTO;
import com.daxia.wz.service.ProfitService;

import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/profit", produces="text/html;charset=UTF-8")
public class AdminProfitController extends BaseController {

	@Autowired
	private ProfitService profitService;

	@Autowired
	private ProfitSetService profitSetService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			ProfitDTO dto = profitService.load(id);
			map.put("n", dto);
		}
		return "admin/profit/profit_detail";
	}

	@RequestMapping(value = "/detailSet")
	public String detailSet(Map<String, Object> map, Long id) {
		List<ProfitSetDTO> list = profitSetService.findAll();
		if(list != null && list.size() > 0){
			map.put("n", list.get(0));
		}

		return "admin/profit/profitset_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('profit')")
	public String save(ProfitDTO dto) throws Exception {
		if (dto.getId() == null) {
			profitService.create(dto);
		} else {
			//ProfitDTO old = profitService.load(dto.getId());
			// old.setXXX(dto.getXXX());
			//profitService.updateAllFields(old);
			if (1 == 1) {
				throw new RuntimeException("请实现更新逻辑");
			} 
		}
		return ok();
	}
	@ResponseBody
	@RequestMapping(value = "/saveSet")
	public String saveSet(ProfitSetDTO dto) throws Exception {
		if (dto.getId() == null) {
			profitSetService.create(dto);
		} else {
			ProfitSetDTO old = profitSetService.load(dto.getId());
			old.setAuto(dto.isAuto());
			old.setProfitCount(dto.getProfitCount());
			old.setProfitDesc(dto.getProfitDesc());
			old.setProfitRatio(dto.getProfitRatio());
			profitSetService.updateAllFields(old);
		}
		return ok();
	}

    @PreAuthorize("hasRole('profit')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		profitService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(ProfitDTO dto, Map<String, Object> map, Page page) {
		List<ProfitDTO> dtos = profitService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		return "admin/profit/profit_list";
	}
	
	@RequestMapping("profitPhases")
	public String profitPhases(Long profitId, Map<String, Object> map) throws Exception {
		List<ProfitPhaseDTO> phases = profitPhaseService.findByProfit(profitId);
		map.put("phases", phases);
		map.put("profitId", profitId);
		return "admin/profit/profit_profitPhases";
	}
	
	/**
	 * 手动返利
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("pay")
	public String pay(Long profitPhaseId) throws Exception {
		ProfitPhaseDTO pp = profitPhaseService.load(profitPhaseId);
		if (pp.getStatus() == ProfitPhaseStatus.Succeed.getValue()) {
			throw new BizException("已经返利过了，不能再返利");
		}
		WxPayUser result = coreService.profitPay(profitPhaseId, false);
		if (result.isSuccess()) {
			return ok();
		} else {
			throw new BizException(result.getErrorMsg());
		}
	}
}
