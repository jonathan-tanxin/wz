package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.DistributionCenterDAO;
import com.daxia.wz.model.DistributionCenter;
import com.daxia.wz.dto.DistributionCenterDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class DistributionCenterService {
	
	@Autowired
	private DistributionCenterDAO distributionCenterDAO;
	
	public List<DistributionCenterDTO> find(DistributionCenterDTO query, Page page) {
		List<DistributionCenter> models = distributionCenterDAO.find(query, page);
		List<DistributionCenterDTO> dtos = toDTOs(models);
		return dtos ;
	}
	
	public List<DistributionCenterDTO> findAll() {
		return this.find(new DistributionCenterDTO(), null);
	}
	
	public List<DistributionCenterDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new DistributionCenterDTO(), page);
	}
	
	public Long create(DistributionCenterDTO dto) {
		DistributionCenter model = new DistributionCenter();
		toModel(model, dto);
		return distributionCenterDAO.create(model);
	}
	
	public DistributionCenterDTO load(Long id) {
	    DistributionCenter model = distributionCenterDAO.load(id);
	    return toDTO(model);
    }

	public DistributionCenter loadCenter(Long id) {
	    DistributionCenter model = distributionCenterDAO.load(id);
	    return model;
    }
	
	public void updateAllFields(DistributionCenterDTO dto) {
		DistributionCenter model = distributionCenterDAO.load(dto.getId());
		toModel(model, dto);
		distributionCenterDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				//distributionCenterDAO.deleteById(id);
				DistributionCenter model = distributionCenterDAO.load(id);
				model.setIsdel(1);
				distributionCenterDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public DistributionCenterDTO findOne(DistributionCenterDTO query) {
		DistributionCenter model = distributionCenterDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<DistributionCenterDTO> toDTOs(List<DistributionCenter> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<DistributionCenterDTO>(0);
		}
		List<DistributionCenterDTO> dtos = new ArrayList<DistributionCenterDTO>(models.size());
		for (DistributionCenter model : models) {
	        DistributionCenterDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private DistributionCenterDTO toDTO(DistributionCenter model) {
		if (model == null) {
			return null;
		}
		DistributionCenterDTO dto = BeanMapper.map(model, DistributionCenterDTO.class);
		
		return dto;
	}
	
	private void toModel(DistributionCenter model, DistributionCenterDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<DistributionCenter> toModels(List<DistributionCenterDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<DistributionCenter>(0);
		}
		List<DistributionCenter> models = new ArrayList<DistributionCenter>(dtos.size());
		for (DistributionCenterDTO dto : dtos) {
	        DistributionCenter model = new DistributionCenter();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
