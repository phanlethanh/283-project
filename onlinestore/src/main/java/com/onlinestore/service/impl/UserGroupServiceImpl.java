package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.UserGroupDao;
import com.onlinestore.model.UserGroup;
import com.onlinestore.service.UserGroupService;

@Service("userGroupFeeService")
@Transactional
public class UserGroupServiceImpl implements UserGroupService {

	
	private UserGroupDao userGroupDao;
	
	public void createUserGroup(UserGroup userGroup) {
		userGroupDao.create(userGroup);
	}

	public List<UserGroup> getUserGroups() {
		return userGroupDao.getAll();
	}

	public UserGroup getUserGroup(Integer id) {
		return userGroupDao.get(id);
	}

	public void updateUserGroup(UserGroup userGroup) {
		userGroupDao.update(userGroup);
	}

	public void deleteUserGroup(Integer id) {
		userGroupDao.deleteById(id);
	}

}
