package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.CardDAO;
import com.daxia.wz.model.Card;
import com.daxia.wz.dto.CardDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

@Service
public class CardService {
	
	@Autowired
	private CardDAO cardDAO;
	
	public List<CardDTO> find(CardDTO query, Page page) {
		List<Card> models = cardDAO.find(query, page);
		List<CardDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<CardDTO> findAll() {
		return this.find(new CardDTO(), null);
	}
	
	public List<CardDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new CardDTO(), page);
	}
	
	public Long create(CardDTO dto) {
		Card model = new Card();
		toModel(model, dto);
		return cardDAO.create(model);
	}
	
	public CardDTO load(Long id) {
	    Card model = cardDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(CardDTO dto) {
		Card model = cardDAO.load(dto.getId());
		toModel(model, dto);
		cardDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				//throw new RuntimeException("未实现删除逻辑，请确认是物理删除还是逻辑删除");
				 //cardDAO.deleteById(id);
				Card model = cardDAO.load(id);
				model.setIsdel(1);
				cardDAO.update(model);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public CardDTO findOne(CardDTO query) {
		Card model = cardDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<CardDTO> toDTOs(List<Card> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<CardDTO>(0);
		}
		List<CardDTO> dtos = new ArrayList<CardDTO>(models.size());
		for (Card model : models) {
	        CardDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private CardDTO toDTO(Card model) {
		if (model == null) {
			return null;
		}
		CardDTO dto = BeanMapper.map(model, CardDTO.class);
		
		return dto;
	}
	
	private void toModel(Card model, CardDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<Card> toModels(List<CardDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<Card>(0);
		}
		List<Card> models = new ArrayList<Card>(dtos.size());
		for (CardDTO dto : dtos) {
	        Card model = new Card();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public List<CardDTO> findByType(Integer cardType) {
		CardDTO query = new CardDTO();
		query.setType(cardType);
		return this.find(query, null);
	}
}
