package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.AddressDAO;
import com.daxia.wz.dto.AddressDTO;
import com.daxia.wz.model.Address;
import com.daxia.wz.model.Customer;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	public List<AddressDTO> find(AddressDTO query, Page page) {
		List<Address> models = addressDAO.find(query, page);
		List<AddressDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<AddressDTO> findAll() {
		return this.find(new AddressDTO(), null);
	}
	
	public List<AddressDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new AddressDTO(), page);
	}
	
	public Long create(AddressDTO dto) {
		Address model = new Address();
		toModel(model, dto);
		return addressDAO.create(model);
	}
	
	public AddressDTO load(Long id) {
	    Address model = addressDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(AddressDTO dto) {
		Address model = addressDAO.load(dto.getId());
		toModel(model, dto);
		addressDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 addressDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public AddressDTO findOne(AddressDTO query) {
		Address model = addressDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<AddressDTO> toDTOs(List<Address> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<AddressDTO>(0);
		}
		List<AddressDTO> dtos = new ArrayList<AddressDTO>(models.size());
		for (Address model : models) {
	        AddressDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private AddressDTO toDTO(Address model) {
		if (model == null) {
			return null;
		}
		AddressDTO dto = BeanMapper.map(model, AddressDTO.class);
		return dto;
	}
	
	private void toModel(Address model, AddressDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Address> toModels(List<AddressDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Address>(0);
		}
		List<Address> models = new ArrayList<Address>(dtos.size());
		for (AddressDTO dto : dtos) {
	        Address model = new Address();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
	
	public AddressDTO findByCustomer(Long id) {
		AddressDTO query = new AddressDTO();
		query.setCustomer(new Customer(id));
		return this.findOne(query);
	}
}
