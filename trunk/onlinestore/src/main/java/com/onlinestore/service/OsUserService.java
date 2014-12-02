package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.OsUser;

public interface OsUserService {
	void createOsUser(OsUser osUser);
	
	List<OsUser> getOsUsers();
	
	OsUser getOsUser(Long id);
	
	
	void updateOsUser(OsUser osUser);
	
	void deleteOsUser(Integer id);
}
