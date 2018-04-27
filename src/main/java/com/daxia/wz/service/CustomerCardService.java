package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.CustomerCardDAO;
import com.daxia.wz.model.CustomerCard;
import com.daxia.wz.dto.CustomerCardDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CustomerCardService {
	
	@Autowired
	private CustomerCardDAO customerCardDAO;
	
	public List<CustomerCardDTO> find(CustomerCardDTO query, Page page) {
		List<CustomerCard> models = customerCardDAO.find(query, page);
		List<CustomerCardDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CustomerCardDTO> findAll() {
		return this.find(new CustomerCardDTO(), null);
	}
	
	public List<CustomerCardDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CustomerCardDTO(), page);
	}
	
	public Long create(CustomerCardDTO dto) {
		CustomerCard model = new CustomerCard();
		toModel(model, dto);
		return customerCardDAO.create(model);
	}
	
	public CustomerCardDTO load(Long id) {
	    CustomerCard model = customerCardDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CustomerCardDTO dto) {
		CustomerCard model = customerCardDAO.load(dto.getId());
		toModel(model, dto);
		customerCardDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 customerCardDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CustomerCardDTO findOne(CustomerCardDTO query) {
		CustomerCard model = customerCardDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CustomerCardDTO> toDTOs(List<CustomerCard> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CustomerCardDTO>(0);
		}
		List<CustomerCardDTO> dtos = new ArrayList<CustomerCardDTO>(models.size());
		for (CustomerCard model : models) {
	        CustomerCardDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CustomerCardDTO toDTO(CustomerCard model) {
		if (model == null) {
			return null;
		}
		CustomerCardDTO dto = BeanMapper.map(model, CustomerCardDTO.class);
		
		return dto;
	}
	
	private void toModel(CustomerCard model, CustomerCardDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<CustomerCard> toModels(List<CustomerCardDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<CustomerCard>(0);
		}
		List<CustomerCard> models = new ArrayList<CustomerCard>(dtos.size());
		for (CustomerCardDTO dto : dtos) {
	        CustomerCard model = new CustomerCard();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
