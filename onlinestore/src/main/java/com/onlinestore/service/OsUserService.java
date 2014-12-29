package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.OsUser;

public interface OsUserService {
	Integer createOsUser(OsUser osUser);
	
	List<OsUser> getOsUsers();
	
	OsUser getOsUser(Integer id);
	
	void updateOsUser(OsUser osUser);
	
	void deleteOsUser(Integer id);
	
	boolean isAdminUser(Integer id);
}
