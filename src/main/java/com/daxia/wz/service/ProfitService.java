package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.ProfitDAO;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.Profit;
import com.daxia.wz.dto.ProfitDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class ProfitService {
	
	@Autowired
	private ProfitDAO profitDAO;
	
	public List<ProfitDTO> find(ProfitDTO query, Page page) {
		List<Profit> models = profitDAO.find(query, page);
		List<ProfitDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<ProfitDTO> findAll() {
		return this.find(new ProfitDTO(), null);
	}
	
	public List<ProfitDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new ProfitDTO(), page);
	}
	
	public Long create(ProfitDTO dto) {
		Profit model = new Profit();
		toModel(model, dto);
		return profitDAO.create(model);
	}
	
	public ProfitDTO load(Long id) {
	    Profit model = profitDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(ProfitDTO dto) {
		Profit model = profitDAO.load(dto.getId());
		toModel(model, dto);
		profitDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 profitDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public ProfitDTO findOne(ProfitDTO query) {
		Profit model = profitDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<ProfitDTO> toDTOs(List<Profit> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<ProfitDTO>(0);
		}
		List<ProfitDTO> dtos = new ArrayList<ProfitDTO>(models.size());
		for (Profit model : models) {
	        ProfitDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private ProfitDTO toDTO(Profit model) {
		if (model == null) {
			return null;
		}
		ProfitDTO dto = BeanMapper.map(model, ProfitDTO.class);
		
		return dto;
	}
	
	private void toModel(Profit model, ProfitDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Profit> toModels(List<ProfitDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Profit>(0);
		}
		List<Profit> models = new ArrayList<Profit>(dtos.size());
		for (ProfitDTO dto : dtos) {
	        Profit model = new Profit();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<ProfitDTO> findByCustomer(Long id) {
		ProfitDTO query = new ProfitDTO();
		query.setProfitCustomer(new Customer(id));
		return this.find(query, null);
	}
}
