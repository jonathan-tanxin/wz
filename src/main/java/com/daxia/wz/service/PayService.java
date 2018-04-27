package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.PayDAO;
import com.daxia.wz.model.Pay;
import com.daxia.wz.dto.PayDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public List<PayDTO> find(PayDTO query, Page page) {
		List<Pay> models = payDAO.find(query, page);
		List<PayDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<PayDTO> findAll() {
		return this.find(new PayDTO(), null);
	}
	
	public List<PayDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new PayDTO(), page);
	}
	
	public Long create(PayDTO dto) {
		Pay model = new Pay();
		toModel(model, dto);
		return payDAO.create(model);
	}
	
	public PayDTO load(Long id) {
	    Pay model = payDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(PayDTO dto) {
		Pay model = payDAO.load(dto.getId());
		toModel(model, dto);
		payDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 payDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public PayDTO findOne(PayDTO query) {
		Pay model = payDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<PayDTO> toDTOs(List<Pay> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<PayDTO>(0);
		}
		List<PayDTO> dtos = new ArrayList<PayDTO>(models.size());
		for (Pay model : models) {
	        PayDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private PayDTO toDTO(Pay model) {
		if (model == null) {
			return null;
		}
		PayDTO dto = BeanMapper.map(model, PayDTO.class);
		
		return dto;
	}
	
	private void toModel(Pay model, PayDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Pay> toModels(List<PayDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Pay>(0);
		}
		List<Pay> models = new ArrayList<Pay>(dtos.size());
		for (PayDTO dto : dtos) {
	        Pay model = new Pay();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public PayDTO findByPrepayId(String prepayId) {
		return toDTO(payDAO.findByPrepayId(prepayId));
	}
}
