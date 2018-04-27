package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.CustomerBalanceDetailDAO;
import com.daxia.wz.model.CustomerBalanceDetail;
import com.daxia.wz.dto.CustomerBalanceDetailDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CustomerBalanceDetailService {
	
	@Autowired
	private CustomerBalanceDetailDAO customerBalanceDetailDAO;
	
	public List<CustomerBalanceDetailDTO> find(CustomerBalanceDetailDTO query, Page page) {
		List<CustomerBalanceDetail> models = customerBalanceDetailDAO.find(query, page);
		List<CustomerBalanceDetailDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CustomerBalanceDetailDTO> findAll() {
		return this.find(new CustomerBalanceDetailDTO(), null);
	}
	
	public List<CustomerBalanceDetailDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CustomerBalanceDetailDTO(), page);
	}
	
	public Long create(CustomerBalanceDetailDTO dto) {
		CustomerBalanceDetail model = new CustomerBalanceDetail();
		toModel(model, dto);
		return customerBalanceDetailDAO.create(model);
	}
	
	public CustomerBalanceDetailDTO load(Long id) {
	    CustomerBalanceDetail model = customerBalanceDetailDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CustomerBalanceDetailDTO dto) {
		CustomerBalanceDetail model = customerBalanceDetailDAO.load(dto.getId());
		toModel(model, dto);
		customerBalanceDetailDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 customerBalanceDetailDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CustomerBalanceDetailDTO findOne(CustomerBalanceDetailDTO query) {
		CustomerBalanceDetail model = customerBalanceDetailDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CustomerBalanceDetailDTO> toDTOs(List<CustomerBalanceDetail> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CustomerBalanceDetailDTO>(0);
		}
		List<CustomerBalanceDetailDTO> dtos = new ArrayList<CustomerBalanceDetailDTO>(models.size());
		for (CustomerBalanceDetail model : models) {
	        CustomerBalanceDetailDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CustomerBalanceDetailDTO toDTO(CustomerBalanceDetail model) {
		if (model == null) {
			return null;
		}
		CustomerBalanceDetailDTO dto = BeanMapper.map(model, CustomerBalanceDetailDTO.class);
		
		return dto;
	}
	
	private void toModel(CustomerBalanceDetail model, CustomerBalanceDetailDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<CustomerBalanceDetail> toModels(List<CustomerBalanceDetailDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<CustomerBalanceDetail>(0);
		}
		List<CustomerBalanceDetail> models = new ArrayList<CustomerBalanceDetail>(dtos.size());
		for (CustomerBalanceDetailDTO dto : dtos) {
	        CustomerBalanceDetail model = new CustomerBalanceDetail();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
