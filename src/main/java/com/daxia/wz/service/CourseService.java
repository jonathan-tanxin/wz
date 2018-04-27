package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.common.CourseStatus;
import com.daxia.wz.dao.CourseDAO;
import com.daxia.wz.model.Course;
import com.daxia.wz.dto.CourseDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CourseService {
	
	@Autowired
	private CourseDAO courseDAO;
	
	public List<CourseDTO> find(CourseDTO query, Page page) {
		List<Course> models = courseDAO.find(query, page);
		List<CourseDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CourseDTO> findAll() {
		return this.find(new CourseDTO(), null);
	}
	
	public List<CourseDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CourseDTO(), page);
	}
	
	public Long create(CourseDTO dto) {
		Course model = new Course();
		toModel(model, dto);
		return courseDAO.create(model);
	}
	
	public CourseDTO load(Long id) {
	    Course model = courseDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CourseDTO dto) {
		Course model = courseDAO.load(dto.getId());
		toModel(model, dto);
		courseDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				//courseDAO.deleteById(id);
				Course model = courseDAO.load(id);
				model.setIsdel(1);
				courseDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CourseDTO findOne(CourseDTO query) {
		Course model = courseDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CourseDTO> toDTOs(List<Course> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CourseDTO>(0);
		}
		List<CourseDTO> dtos = new ArrayList<CourseDTO>(models.size());
		for (Course model : models) {
	        CourseDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CourseDTO toDTO(Course model) {
		if (model == null) {
			return null;
		}
		CourseDTO dto = BeanMapper.map(model, CourseDTO.class);
		
		return dto;
	}
	
	private void toModel(Course model, CourseDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Course> toModels(List<CourseDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Course>(0);
		}
		List<Course> models = new ArrayList<Course>(dtos.size());
		for (CourseDTO dto : dtos) {
	        Course model = new Course();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<CourseDTO> findValid() {
		CourseDTO query = new CourseDTO();
		query.setStatus(CourseStatus.Active.getValue());
		return this.find(query, null);
	}
}
