package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.CategoryDAO;
import com.daxia.wz.model.Category;
import com.daxia.wz.dto.CategoryDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	public List<CategoryDTO> find(CategoryDTO query, Page page) {
		List<Category> models = categoryDAO.find(query, page);
		List<CategoryDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CategoryDTO> findAll() {
		return this.find(new CategoryDTO(), null);
	}
	
	public List<CategoryDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CategoryDTO(), page);
	}
	
	public Long create(CategoryDTO dto) {
		Category model = new Category();
		toModel(model, dto);
		return categoryDAO.create(model);
	}
	
	public CategoryDTO load(Long id) {
	    Category model = categoryDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CategoryDTO dto) {
		Category model = categoryDAO.load(dto.getId());
		toModel(model, dto);
		categoryDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				//categoryDAO.deleteById(id);
				Category model = categoryDAO.load(id);
				model.setIsdel(1);
				categoryDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CategoryDTO findOne(CategoryDTO query) {
		Category model = categoryDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CategoryDTO> toDTOs(List<Category> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CategoryDTO>(0);
		}
		List<CategoryDTO> dtos = new ArrayList<CategoryDTO>(models.size());
		for (Category model : models) {
	        CategoryDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CategoryDTO toDTO(Category model) {
		if (model == null) {
			return null;
		}
		CategoryDTO dto = BeanMapper.map(model, CategoryDTO.class);
		
		return dto;
	}
	
	private void toModel(Category model, CategoryDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Category> toModels(List<CategoryDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Category>(0);
		}
		List<Category> models = new ArrayList<Category>(dtos.size());
		for (CategoryDTO dto : dtos) {
	        Category model = new Category();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
