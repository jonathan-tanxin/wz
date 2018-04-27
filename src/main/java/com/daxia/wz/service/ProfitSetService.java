package com.daxia.wz.service;

import com.daxia.wz.dao.ProfitSetDAO;
import com.daxia.wz.dto.ProfitSetDTO;
import com.daxia.wz.model.ProfitSet;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProfitSetService {
	
	@Autowired
	private ProfitSetDAO profitSetDAO;
	
	public List<ProfitSetDTO> find(ProfitSetDTO query, Page page) {
		List<ProfitSet> models = profitSetDAO.find(query, page);
		List<ProfitSetDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<ProfitSetDTO> findAll() {
		return this.find(new ProfitSetDTO(), null);
	}
	
	public List<ProfitSetDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new ProfitSetDTO(), page);
	}
	
	public Long create(ProfitSetDTO dto) {
		ProfitSet model = new ProfitSet();
		toModel(model, dto);
		return profitSetDAO.create(model);
	}
	
	public ProfitSetDTO load(Long id) {
	    ProfitSet model = profitSetDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(ProfitSetDTO dto) {
		ProfitSet model = profitSetDAO.load(dto.getId());
		toModel(model, dto);
		profitSetDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 profitSetDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public ProfitSetDTO findOne(ProfitSetDTO query) {
		ProfitSet model = profitSetDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<ProfitSetDTO> toDTOs(List<ProfitSet> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<ProfitSetDTO>(0);
		}
		List<ProfitSetDTO> dtos = new ArrayList<ProfitSetDTO>(models.size());
		for (ProfitSet model : models) {
	        ProfitSetDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private ProfitSetDTO toDTO(ProfitSet model) {
		if (model == null) {
			return null;
		}
		ProfitSetDTO dto = BeanMapper.map(model, ProfitSetDTO.class);
		
		return dto;
	}
	
	private void toModel(ProfitSet model, ProfitSetDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<ProfitSet> toModels(List<ProfitSetDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<ProfitSet>(0);
		}
		List<ProfitSet> models = new ArrayList<ProfitSet>(dtos.size());
		for (ProfitSetDTO dto : dtos) {
	        ProfitSet model = new ProfitSet();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
