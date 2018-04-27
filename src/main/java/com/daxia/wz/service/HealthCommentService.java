package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.HealthCommentDAO;
import com.daxia.wz.model.HealthComment;
import com.daxia.wz.dto.HealthCommentDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class HealthCommentService {
	
	@Autowired
	private HealthCommentDAO healthCommentDAO;
	
	public List<HealthCommentDTO> find(HealthCommentDTO query, Page page) {
		List<HealthComment> models = healthCommentDAO.find(query, page);
		List<HealthCommentDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<HealthCommentDTO> findAll() {
		return this.find(new HealthCommentDTO(), null);
	}
	
	public List<HealthCommentDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new HealthCommentDTO(), page);
	}
	
	public Long create(HealthCommentDTO dto) {
		HealthComment model = new HealthComment();
		toModel(model, dto);
		return healthCommentDAO.create(model);
	}
	
	public HealthCommentDTO load(Long id) {
	    HealthComment model = healthCommentDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(HealthCommentDTO dto) {
		HealthComment model = healthCommentDAO.load(dto.getId());
		toModel(model, dto);
		healthCommentDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 healthCommentDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public HealthCommentDTO findOne(HealthCommentDTO query) {
		HealthComment model = healthCommentDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<HealthCommentDTO> toDTOs(List<HealthComment> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<HealthCommentDTO>(0);
		}
		List<HealthCommentDTO> dtos = new ArrayList<HealthCommentDTO>(models.size());
		for (HealthComment model : models) {
	        HealthCommentDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private HealthCommentDTO toDTO(HealthComment model) {
		if (model == null) {
			return null;
		}
		HealthCommentDTO dto = BeanMapper.map(model, HealthCommentDTO.class);
		
		return dto;
	}
	
	private void toModel(HealthComment model, HealthCommentDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<HealthComment> toModels(List<HealthCommentDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<HealthComment>(0);
		}
		List<HealthComment> models = new ArrayList<HealthComment>(dtos.size());
		for (HealthCommentDTO dto : dtos) {
	        HealthComment model = new HealthComment();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
