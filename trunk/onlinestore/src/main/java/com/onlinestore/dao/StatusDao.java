package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Status;

public interface StatusDao extends Dao<Status>{
	List<Status> getProductStatuses();
}
