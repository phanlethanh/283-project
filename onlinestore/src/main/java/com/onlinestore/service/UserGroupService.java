package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.UserGroup;

public interface UserGroupService {
	void createUserGroup(UserGroup userGroup);
	
	List<UserGroup> getUserGroups();
	
	UserGroup getUserGroup(Long id);
	
	void updateUserGroup(UserGroup userGroup);
	
	void deleteUserGroup(Long id);
}
