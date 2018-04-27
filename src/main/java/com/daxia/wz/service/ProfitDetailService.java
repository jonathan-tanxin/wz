package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.ProfitDetailDAO;
import com.daxia.wz.model.ProfitDetail;
import com.daxia.wz.dto.ProfitDetailDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class ProfitDetailService {
	
	@Autowired
	private ProfitDetailDAO profitDetailDAO;
	
	public List<ProfitDetailDTO> find(ProfitDetailDTO query, Page page) {
		List<ProfitDetail> models = profitDetailDAO.find(query, page);
		List<ProfitDetailDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<ProfitDetailDTO> findAll() {
		return this.find(new ProfitDetailDTO(), null);
	}
	
	public List<ProfitDetailDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new ProfitDetailDTO(), page);
	}
	
	public Long create(ProfitDetailDTO dto) {
		ProfitDetail model = new ProfitDetail();
		toModel(model, dto);
		return profitDetailDAO.create(model);
	}
	
	public ProfitDetailDTO load(Long id) {
	    ProfitDetail model = profitDetailDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(ProfitDetailDTO dto) {
		ProfitDetail model = profitDetailDAO.load(dto.getId());
		toModel(model, dto);
		profitDetailDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 profitDetailDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public ProfitDetailDTO findOne(ProfitDetailDTO query) {
		ProfitDetail model = profitDetailDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<ProfitDetailDTO> toDTOs(List<ProfitDetail> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<ProfitDetailDTO>(0);
		}
		List<ProfitDetailDTO> dtos = new ArrayList<ProfitDetailDTO>(models.size());
		for (ProfitDetail model : models) {
	        ProfitDetailDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private ProfitDetailDTO toDTO(ProfitDetail model) {
		if (model == null) {
			return null;
		}
		ProfitDetailDTO dto = BeanMapper.map(model, ProfitDetailDTO.class);
		
		return dto;
	}
	
	private void toModel(ProfitDetail model, ProfitDetailDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<ProfitDetail> toModels(List<ProfitDetailDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<ProfitDetail>(0);
		}
		List<ProfitDetail> models = new ArrayList<ProfitDetail>(dtos.size());
		for (ProfitDetailDTO dto : dtos) {
	        ProfitDetail model = new ProfitDetail();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
