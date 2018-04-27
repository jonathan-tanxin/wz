package com.daxia.wz.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.HealthCommentDAO;
import com.daxia.wz.dao.HealthDAO;
import com.daxia.wz.dto.HealthChartDTO;
import com.daxia.wz.dto.HealthDTO;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.Health;
import com.daxia.wz.model.HealthComment;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;
import com.google.common.collect.Lists;

@Service
public class HealthService {
	
	@Autowired
	private HealthDAO healthDAO;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private HealthCommentDAO healthCommentDAO;
	
	public List<HealthDTO> find(HealthDTO query, Page page) {
		List<Health> models = healthDAO.find(query, page);
		List<HealthDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<HealthDTO> findAll() {
		return this.find(new HealthDTO(), null);
	}
	
	public List<HealthDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new HealthDTO(), page);
	}
	
	public Long create(HealthDTO dto) {
		Health model = new Health();
		toModel(model, dto);
		return healthDAO.create(model);
	}
	
	public HealthDTO load(Long id) {
	    Health model = healthDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(HealthDTO dto) {
		Health model = healthDAO.load(dto.getId());
		toModel(model, dto);
		healthDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 healthDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public HealthDTO findOne(HealthDTO query) {
		Health model = healthDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<HealthDTO> toDTOs(List<Health> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<HealthDTO>(0);
		}
		List<HealthDTO> dtos = new ArrayList<HealthDTO>(models.size());
		for (Health model : models) {
	        HealthDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private HealthDTO toDTO(Health model) {
		if (model == null) {
			return null;
		}
		HealthDTO dto = BeanMapper.map(model, HealthDTO.class);
		
		return dto;
	}
	
	private void toModel(Health model, HealthDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Health> toModels(List<HealthDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Health>(0);
		}
		List<Health> models = new ArrayList<Health>(dtos.size());
		for (HealthDTO dto : dtos) {
	        Health model = new Health();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public HealthChartDTO find7daysByCustomer(Long customerId) {
		HealthDTO query = new HealthDTO();
		query.setCustomer(new Customer(customerId));
		Page page = new Page();
		page.setPageSize(7);
		List<Health> models = healthDAO.find(query, page);
		Collections.sort(models, new Comparator<Health>() {

			@Override
			public int compare(Health o1, Health o2) {
				return o1.getDate().compareTo(o2.getDate());
			}
		});
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
		List<String> days = Lists.newArrayList();
		List<String> xhdbArr= Lists.newArrayList();
		List<String> xzgArr = Lists.newArrayList();
		List<String> szyArr = Lists.newArrayList();
		List<String> ssyArr = Lists.newArrayList();
		for (Health health : models) {
			days.add("'" + dateFormat.format(health.getDate()) + "'");
			xhdbArr.add(health.getXhdb());
			xzgArr.add(health.getXzg());
			szyArr.add(health.getSzy() + "");
			ssyArr.add(health.getSsy() + "");
		}
		
		HealthChartDTO dto = new HealthChartDTO();
		dto.setCustomer(customerService.load(customerId));
		dto.setDays(StringUtils.join(days, ","));
		dto.setXhdbArr(StringUtils.join(xhdbArr, ","));
		dto.setXzgArr(StringUtils.join(xzgArr, ","));
		dto.setSzyArr(StringUtils.join(szyArr, ","));
		dto.setSsyArr(StringUtils.join(ssyArr, ","));
		
		List<HealthComment> comments = healthCommentDAO.findByCustomer(customerId);
		dto.setComments(comments);
		
		return dto;
	}
}
