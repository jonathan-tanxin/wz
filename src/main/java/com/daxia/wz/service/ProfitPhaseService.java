package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.ProfitPhaseDAO;
import com.daxia.wz.model.Profit;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.dto.ProfitPhaseDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class ProfitPhaseService {
	
	@Autowired
	private ProfitPhaseDAO profitPhaseDAO;
	
	public List<ProfitPhaseDTO> find(ProfitPhaseDTO query, Page page) {
		List<ProfitPhase> models = profitPhaseDAO.find(query, page);
		List<ProfitPhaseDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<ProfitPhaseDTO> findAll() {
		return this.find(new ProfitPhaseDTO(), null);
	}
	
	public List<ProfitPhaseDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new ProfitPhaseDTO(), page);
	}
	
	public Long create(ProfitPhaseDTO dto) {
		ProfitPhase model = new ProfitPhase();
		toModel(model, dto);
		return profitPhaseDAO.create(model);
	}
	
	public ProfitPhaseDTO load(Long id) {
	    ProfitPhase model = profitPhaseDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(ProfitPhaseDTO dto) {
		ProfitPhase model = profitPhaseDAO.load(dto.getId());
		toModel(model, dto);
		profitPhaseDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 profitPhaseDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public ProfitPhaseDTO findOne(ProfitPhaseDTO query) {
		ProfitPhase model = profitPhaseDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<ProfitPhaseDTO> toDTOs(List<ProfitPhase> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<ProfitPhaseDTO>(0);
		}
		List<ProfitPhaseDTO> dtos = new ArrayList<ProfitPhaseDTO>(models.size());
		for (ProfitPhase model : models) {
	        ProfitPhaseDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private ProfitPhaseDTO toDTO(ProfitPhase model) {
		if (model == null) {
			return null;
		}
		ProfitPhaseDTO dto = BeanMapper.map(model, ProfitPhaseDTO.class);
		
		return dto;
	}
	
	private void toModel(ProfitPhase model, ProfitPhaseDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<ProfitPhase> toModels(List<ProfitPhaseDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<ProfitPhase>(0);
		}
		List<ProfitPhase> models = new ArrayList<ProfitPhase>(dtos.size());
		for (ProfitPhaseDTO dto : dtos) {
	        ProfitPhase model = new ProfitPhase();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<ProfitPhaseDTO> findByProfit(Long profitId) {
		ProfitPhaseDTO query = new ProfitPhaseDTO();
		query.setProfit(new Profit(profitId));
		return this.find(query, null);
	}
}
