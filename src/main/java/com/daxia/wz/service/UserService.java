package com.daxia.wz.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.core.exception.BizException;
import com.daxia.wz.common.UserType;
import com.daxia.wz.dao.UserDAO;
import com.daxia.wz.dto.UserDTO;
import com.daxia.wz.model.User;
import com.daxia.wz.security.PasswordEncoder;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.BeanMapper;
import com.daxia.wz.util.ValidationUtils;


@Service
public class UserService {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDAO userDAO;

	public List<UserDTO> find(UserDTO query, Page page) {
		List<User> models = userDAO.find(query, page);
		List<UserDTO> dtos = toDTOs(models);
		return dtos;
	}
	
	public List<UserDTO> findAll() {
		return this.find(new UserDTO(), null);
	}
	
	public List<UserDTO> find(int count) {
		Page page = new Page();
		page.setPage(1);
		page.setPageSize(count);
		return this.find(new UserDTO(), page);
	}
	
	public Long create(UserDTO dto) {
		User model = new User();
		toModel(model, dto);
		Long id = userDAO.create(model);
		return id;
	}
	
	public UserDTO load(Long id) {
	    User model = userDAO.load(id);
	    return toDTO(model);
    }

	public void updateAllFields(UserDTO dto) {
		User model = userDAO.load(dto.getId());
		toModel(model, dto);
		userDAO.update(model);
    }

	public void deleteByIds(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				if (id == 1) {
					throw new RuntimeException("该用户无法删除");
				}
				// userDAO.deleteById(id);
				User user = userDAO.load(id);
				user.setUsername("【删】" + user.getUsername());
				user.setDeleted(true);
				userDAO.update(user);
			}
		}
    }
	
	public void deleteById(Long id) {
		this.deleteByIds(new Long[] {id});
	}
	
	public UserDTO findOne(UserDTO query) {
		User model = userDAO.findOne(query);
		return toDTO(model);
	}
	
	private List<UserDTO> toDTOs(List<User> models) {
		if (CollectionUtils.isEmpty(models)) {
			return new ArrayList<UserDTO>(0);
		}
		List<UserDTO> dtos = new ArrayList<UserDTO>(models.size());
		for (User model : models) {
	        UserDTO dto = toDTO(model);
	        dtos.add(dto);
        }
	    return dtos;
    }
    
    private UserDTO toDTO(User model) {
		if (model == null) {
			return null;
		}
		UserDTO dto = BeanMapper.map(model, UserDTO.class);
		
		return dto;
	}
	
	private void toModel(User model, UserDTO dto) {
		BeanMapper.copy(dto, model);
    }
	
	@SuppressWarnings("unused")
	private List<User> toModels(List<UserDTO> dtos) {
		if (CollectionUtils.isEmpty(dtos)) {
			return new ArrayList<User>(0);
		}
		List<User> models = new ArrayList<User>(dtos.size());
		for (UserDTO dto : dtos) {
	        User model = new User();
	        toModel(model, dto);
	        models.add(model);
        }
		return models;
	}
    
    public UserDTO login(String username, String password) {
		ValidationUtils.assertTrue(StringUtils.isNotBlank(username), "用户名不能为空");
		ValidationUtils.assertTrue(StringUtils.isNotBlank(password), "密码不能为空");
		
		UserDTO query = new UserDTO();
		query.setUsername(username);
		query.setPassword(passwordEncoder.encodePassword(password, username));
		
		User user = userDAO.findOne(query);
		if (user == null || !username.equalsIgnoreCase(user.getUsername())) {
			return null;
		} 
		return toDTO(user);
    }

    @Transactional
	public void resetPassword(String newPassword, Long userId) {
		User user = userDAO.load(userId);
		if ( user == null ){
			throw new BizException("该用户不存在");
		}
		String newPwd = passwordEncoder.encodePassword(newPassword, user.getUsername());
		user.setPassword(newPwd);
		userDAO.update(user);
	}

	public UserDTO findByOpenid(String openid) {
		User user = userDAO.loadUserByUsername(openid);
		return toDTO(user);
	}
	
	public UserDTO createFromWx(String openid, String nickName) {
		UserDTO dto = new UserDTO();
		dto.setUsername(openid);
		dto.setNickName(nickName);
		dto.setType(UserType.WX.getValue());
		Long id = create(dto);
		return load(id);
	}
}
