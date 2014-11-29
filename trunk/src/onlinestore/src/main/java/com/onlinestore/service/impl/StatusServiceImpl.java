package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.StatusDao;
import com.onlinestore.model.Status;
import com.onlinestore.service.StatusService;

@Service("statusService")
@Transactional
public class StatusServiceImpl implements StatusService {

	@Autowired
	private StatusDao statusDao;

	public void createStatus(Status status) {
		statusDao.create(status);
	}

	public List<Status> getStatuses() {
		return statusDao.getAll();
	}

	public Status getStatus(Long id) {
		return statusDao.get(id);
	}

	public void updateStatus(Status status) {
		statusDao.update(status);
	}

	public void deleteStatus(Long id) {
		statusDao.deleteById(id);
	}
}
