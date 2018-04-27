package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Transient;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.wz.dao.DishDAO;
import com.daxia.wz.model.Category;
import com.daxia.wz.model.Dish;
import com.daxia.wz.dto.DishDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class DishService {
	
	@Autowired
	private DishDAO dishDAO;
	
	public List<DishDTO> find(DishDTO query, Page page) {
		List<Dish> models = dishDAO.find(query, page);
		List<DishDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<DishDTO> findAll() {
		return this.find(new DishDTO(), null);
	}
	
	public List<DishDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new DishDTO(), page);
	}
	
	public Long create(DishDTO dto) {
		Dish model = new Dish();
		toModel(model, dto);
		return dishDAO.create(model);
	}
	
	public DishDTO load(Long id) {
	    Dish model = dishDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(DishDTO dto) {
		Dish model = dishDAO.load(dto.getId());
		toModel(model, dto);
		dishDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				//dishDAO.deleteById(id);
				Dish model = dishDAO.load(id);
				model.setIsdel(1);
				dishDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public DishDTO findOne(DishDTO query) {
		Dish model = dishDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<DishDTO> toDTOs(List<Dish> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<DishDTO>(0);
		}
		List<DishDTO> dtos = new ArrayList<DishDTO>(models.size());
		for (Dish model : models) {
	        DishDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private DishDTO toDTO(Dish model) {
		if (model == null) {
			return null;
		}
		DishDTO dto = BeanMapper.map(model, DishDTO.class);
		
		return dto;
	}
	
	private void toModel(Dish model, DishDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Dish> toModels(List<DishDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Dish>(0);
		}
		List<Dish> models = new ArrayList<Dish>(dtos.size());
		for (DishDTO dto : dtos) {
	        Dish model = new Dish();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<DishDTO> findByCategory(Long id) {
		DishDTO query = new DishDTO();
		query.setCategory(new Category(id));
		return this.find(query, null);
	}

	/**
	 * 只显示会员的菜
	 * @param id
	 * @return
	 */
	public List<DishDTO> findByCategoryAndMember(Long id) {
		DishDTO query = new DishDTO();
		query.setCategory(new Category(id));
		query.setIsCustomerOwner(true);
		return this.find(query, null);
	}

	@Transactional
	public void updateMonthSold() {
		dishDAO.executeUpdate("update Dish set monthSold = 0", null);
	}
}
