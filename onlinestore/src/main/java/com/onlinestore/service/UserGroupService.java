package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.UserGroup;

public interface UserGroupService {
	Integer createUserGroup(UserGroup userGroup);
	
	List<UserGroup> getUserGroups();
	
	UserGroup getUserGroup(Integer id);
	
	void updateUserGroup(UserGroup userGroup);
	
	void deleteUserGroup(Integer id);
}
