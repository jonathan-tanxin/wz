package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.kwx.dto.WxAuth;
import com.daxia.wxpay.common.CardType;
import com.daxia.wz.dao.CustomerCardDAO;
import com.daxia.wz.dao.CustomerDAO;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.CustomerCard;
import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private CustomerCardDAO customerCardDAO;
	
	public List<CustomerDTO> find(CustomerDTO query, Page page) {
		List<Customer> models = customerDAO.find(query, page);
		List<CustomerDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CustomerDTO> findAll() {
		return this.find(new CustomerDTO(), null);
	}
	
	public List<CustomerDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CustomerDTO(), page);
	}
	
	public Long create(CustomerDTO dto) {
		Customer model = new Customer();
		toModel(model, dto);
		return customerDAO.create(model);
	}
	
	public CustomerDTO load(Long id) {
	    Customer model = customerDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CustomerDTO dto) {
		Customer model = customerDAO.load(dto.getId());
		toModel(model, dto);
		customerDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				//customerDAO.deleteById(id);
				Customer model = customerDAO.load(id);
				model.setIsdel(1);
				customerDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CustomerDTO findOne(CustomerDTO query) {
		Customer model = customerDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CustomerDTO> toDTOs(List<Customer> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CustomerDTO>(0);
		}
		List<CustomerDTO> dtos = new ArrayList<CustomerDTO>(models.size());
		for (Customer model : models) {
	        CustomerDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CustomerDTO toDTO(Customer model) {
		if (model == null) {
			return null;
		}
		CustomerDTO dto = BeanMapper.map(model, CustomerDTO.class);
		
		return dto;
	}
	
	private void toModel(Customer model, CustomerDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Customer> toModels(List<CustomerDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Customer>(0);
		}
		List<Customer> models = new ArrayList<Customer>(dtos.size());
		for (CustomerDTO dto : dtos) {
	        Customer model = new Customer();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<CustomerDTO> findMember(CustomerDTO dto, Page page) {
		List<Customer> models = customerDAO.findMember(dto, page);
		List<CustomerDTO> dtos = toDTOs(models);
		return dtos;
	}

	public List<CustomerDTO> findExpert(CustomerDTO dto, Page page) {
		List<Customer> models = customerDAO.findExpert(dto, page);
		List<CustomerDTO> dtos = toDTOs(models);
		return dtos;
	}
	/**
	 * 是否购买过水卡
	 * @param id
	 * @return
	 */
	public boolean hasWaterCard(Long id) {
		CustomerCard cc = customerCardDAO.findValidCard(id, CardType.Water.getValue());
		return cc != null;
	}
	
	public boolean hasDishCard(Long id) {
		CustomerCard cc = customerCardDAO.findValidCard(id, CardType.Dish.getValue());
		return cc != null;
	}

	public CustomerDTO findByOpenid(String openid) {
		CustomerDTO query = new CustomerDTO();
		query.setOpenid(openid);
		return this.findOne(query);
	}

	@Transactional
	public CustomerDTO createFromWx(WxAuth wxAuth, Long inviteCustomerId) {
		Customer c = new Customer();
		c.setNickName(wxAuth.getNickName());
		c.setHeadImage(wxAuth.getHeadImage());
		c.setOpenid(wxAuth.getOpenid());
		c.setCreateTime(new Date());
		c.setLastUpdateTime(new Date());
		c.setIsDishMember(false);
		c.setIsWaterMember(false);
		c.setDishLeft(0);
		c.setWaterLeft(0);
		c.setIsExpert(false);
		c.setIsdel(0);
		c.setInviteCode("tmp");
		if (inviteCustomerId != null) {
			c.setRecCustomer(customerDAO.load(inviteCustomerId));
		}
		Long id = customerDAO.create(c);
		c = customerDAO.load(id);
		c.setInviteCode(generateInviteCode(id));
		customerDAO.update(c);
		return toDTO(c);
	}

	private String generateInviteCode(Long id) {
		return (10000 + id) + "";
	}
}
