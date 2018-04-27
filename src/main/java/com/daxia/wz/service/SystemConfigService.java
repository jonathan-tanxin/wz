package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.core.exception.BizException;
import com.daxia.wz.cache.SystemConfigCache;
import com.daxia.wz.common.SystemConfigType;
import com.daxia.wz.dao.SystemConfigDAO;
import com.daxia.wz.dto.SystemConfigDTO;
import com.daxia.wz.model.SystemConfig;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;

/**
 * Service层，类要加@Service标识
 * 一般都是由service层操作数据库，
 * 并且，只有save, update, delete等开头的方法，才有新增修改删除数据库表的权限，
 * 其它的方法名只有查询的权限，这是事务管理，具体哪些方法名可以指定这种权限，是在applicationContext.xml文件的txAdvice定义处配置。
 * @author Kewen.Zhu
 *
 */
@Service
public class SystemConfigService {
	
	@Autowired
	private SystemConfigDAO systemConfigDAO;
	@Autowired
	private SystemConfigCache systemConfigCache;
	
	@PostConstruct
	public void init() {
	    /*
	    cache = CacheBuilder.newBuilder()
	            .maximumSize(100)
	            .expireAfterWrite(1, TimeUnit.MINUTES)
	            //.recordStats()
	            .build(new CacheLoader<SystemConfigType, String>() {
	                @Override
	                public String load(SystemConfigType key) throws Exception {
	                    return getFromDB(key);
	                }
	     });  */
	}
	/**
	 * 根据dto的查询条件和分页条件查找记录
	 * @param dto
	 * @param page
	 * @return
	 */
	public List<SystemConfigDTO> find(SystemConfigDTO dto, Page page) {
		List<SystemConfig> models = systemConfigDAO.find(dto, page);
		List<SystemConfigDTO> dtos = toDTOs(models);
		return dtos;
	}

	/**
	 * 将model集合转为dto集合
	 * @param models
	 * @return
	 */
	private List<SystemConfigDTO> toDTOs(List<SystemConfig> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<SystemConfigDTO>(0);
		}
		List<SystemConfigDTO> dtos = new ArrayList<SystemConfigDTO>(models.size());
		for (SystemConfig model : models) {
	        SystemConfigDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
	
	/**
	 * 将model转为dto。属性名和类型相同的部分调用BeanMapper.map()方法，不同的单独转换。
	 * @param model
	 * @return
	 */
	private SystemConfigDTO toDTO(SystemConfig model) {
		if (model == null) {
			return null;
		}
		SystemConfigDTO dto = BeanMapper.map(model, SystemConfigDTO.class);
		
		return dto;
	}
	
	public void create(SystemConfigDTO dto) {
		SystemConfig model = new SystemConfig();
		toModel(model, dto);
		systemConfigDAO.create(model);
	}

	private void toModel(SystemConfig model, SystemConfigDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<SystemConfig> toModels(List<SystemConfigDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<SystemConfig>(0);
		}
		List<SystemConfig> models = new ArrayList<SystemConfig>(dtos.size());
		for (SystemConfigDTO dto : dtos) {
	        SystemConfig model = new SystemConfig();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}

	public SystemConfigDTO load(Long id) {
	    SystemConfig model = systemConfigDAO.load(id);
	    return toDTO(model);
    }
	
	public SystemConfigDTO load(SystemConfigType type) {
		SystemConfigDTO dto = new SystemConfigDTO();
		dto.setKey(type.value());
	    SystemConfig model = systemConfigDAO.findOne(dto);
	    return toDTO(model);
    }

	/**
	 * 这个方法会把dto所有的字段都赋给model，然后更新model。
	 * @param dto
	 */
	public void updateAllFields(SystemConfigDTO dto) {
		SystemConfig model = systemConfigDAO.load(dto.getId());
		toModel(model, dto);
		systemConfigDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				systemConfigDAO.deleteById(id);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}

	public SystemConfigDTO findOne(SystemConfigDTO dto) {
		SystemConfig model = systemConfigDAO.findOne(dto);
		return toDTO(model);
	}
	
	public String get(SystemConfigType type) {
		// return systemConfigCache.get(type);
		String value = getFromDB(type);
		if (StringUtils.isBlank(value)) {
			value = type.defaultValue();
		}
		return value;
	}
	
	public boolean is(SystemConfigType type) {
	    String value = get(type);
	    if (StringUtils.isBlank(value)) {
	        return false;
	    }
	    value = value.trim();
	    
	    return "1".equals(value) || "yes".equalsIgnoreCase(value) || "true".equalsIgnoreCase(value);
	}
	
	public boolean isTestServer() {
	    String value = get(SystemConfigType.isTestServer);
	    return "true".equalsIgnoreCase(value) || "yes".equalsIgnoreCase(value) || "1".equalsIgnoreCase(value);
	}

    private String getFromDB(SystemConfigType type) {
        SystemConfigDTO dto = new SystemConfigDTO();
		dto.setKey(type.value());
		SystemConfig model = systemConfigDAO.findOne(dto);
		if (model == null) {
			return null;
		}
		return model.getValue();
    }
	
	public void update(SystemConfigType type, String value) {
	    SystemConfigDTO dto = new SystemConfigDTO();
        dto.setKey(type.value());
        SystemConfig model = systemConfigDAO.findOne(dto);
        if (model != null) {
            model.setValue(value);
            systemConfigDAO.update(model);
        }
	}
	public SystemConfigDTO findByKey(String key) {
		if (StringUtils.isBlank(key)) {
			return null;
		}
		SystemConfigDTO dto = new SystemConfigDTO();
        dto.setKey(key);
        SystemConfig model = systemConfigDAO.findOne(dto);
        return toDTO(model);
	}
	
	@Transactional
	public void set(String key, String value) {
		SystemConfig model = new SystemConfig();
		model.setKey(key);
		model.setValue(value);
		systemConfigDAO.create(model);
	}
	
	@Transactional
	public void set2(String key, String value) {
		throw new BizException("rollback");
	}
}
