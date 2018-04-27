package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.OrderDAO;
import com.daxia.wz.model.Order;
import com.daxia.wz.dto.OrderDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderDTO> find(OrderDTO query, Page page) {
		List<Order> models = orderDAO.find(query, page);
		List<OrderDTO> dtos = toDTOs(models);
		return dtos;
	}

	public List<OrderDTO> list(OrderDTO query){
		List<Order> models = orderDAO.find(query, null);
		List<OrderDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<OrderDTO> findAll() {
		return this.find(new OrderDTO(), null);
	}
	
	public List<OrderDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new OrderDTO(), page);
	}
	
	public Long create(OrderDTO dto) {
		Order model = new Order();
		toModel(model, dto);
		return orderDAO.create(model);
	}
	
	public OrderDTO load(Long id) {
	    Order model = orderDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(OrderDTO dto) {
		Order model = orderDAO.load(dto.getId());
		toModel(model, dto);
		orderDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 orderDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public OrderDTO findOne(OrderDTO query) {
		Order model = orderDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<OrderDTO> toDTOs(List<Order> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<OrderDTO>(0);
		}
		List<OrderDTO> dtos = new ArrayList<OrderDTO>(models.size());
		for (Order model : models) {
	        OrderDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private OrderDTO toDTO(Order model) {
		if (model == null) {
			return null;
		}
		OrderDTO dto = BeanMapper.map(model, OrderDTO.class);
		
		return dto;
	}
	
	private void toModel(Order model, OrderDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Order> toModels(List<OrderDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Order>(0);
		}
		List<Order> models = new ArrayList<Order>(dtos.size());
		for (OrderDTO dto : dtos) {
	        Order model = new Order();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
}
