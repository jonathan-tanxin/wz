package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.OrderItemDAO;
import com.daxia.wz.model.OrderItem;
import com.daxia.wz.dto.OrderItemDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class OrderItemService {
	
	@Autowired
	private OrderItemDAO orderItemDAO;
	
	public List<OrderItemDTO> find(OrderItemDTO query, Page page) {
		List<OrderItem> models = orderItemDAO.find(query, page);
		List<OrderItemDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<OrderItemDTO> findAll() {
		return this.find(new OrderItemDTO(), null);
	}
	
	public List<OrderItemDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new OrderItemDTO(), page);
	}
	
	public Long create(OrderItemDTO dto) {
		OrderItem model = new OrderItem();
		toModel(model, dto);
		return orderItemDAO.create(model);
	}
	
	public OrderItemDTO load(Long id) {
	    OrderItem model = orderItemDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(OrderItemDTO dto) {
		OrderItem model = orderItemDAO.load(dto.getId());
		toModel(model, dto);
		orderItemDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 orderItemDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public OrderItemDTO findOne(OrderItemDTO query) {
		OrderItem model = orderItemDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<OrderItemDTO> toDTOs(List<OrderItem> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<OrderItemDTO>(0);
		}
		List<OrderItemDTO> dtos = new ArrayList<OrderItemDTO>(models.size());
		for (OrderItem model : models) {
	        OrderItemDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private OrderItemDTO toDTO(OrderItem model) {
		if (model == null) {
			return null;
		}
		OrderItemDTO dto = BeanMapper.map(model, OrderItemDTO.class);
		
		return dto;
	}
	
	private void toModel(OrderItem model, OrderItemDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<OrderItem> toModels(List<OrderItemDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<OrderItem>(0);
		}
		List<OrderItem> models = new ArrayList<OrderItem>(dtos.size());
		for (OrderItemDTO dto : dtos) {
	        OrderItem model = new OrderItem();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
