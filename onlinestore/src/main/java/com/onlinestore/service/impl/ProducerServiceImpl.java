package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.ProducerDao;
import com.onlinestore.model.Producer;
import com.onlinestore.service.ProducerService;

@Service("producerService")
@Transactional
public class ProducerServiceImpl implements ProducerService {

	@Autowired
	private ProducerDao producerDao;
	
	public Integer createProducer(Producer producer) {
		return (Integer) producerDao.create(producer);		
	}

	public List<Producer> getProducers() {
		return producerDao.getAll();
	}

	public Producer getProducer(Integer id) {
		return producerDao.get(id);
	}

	public void updateProducer(Producer producer) {
		producerDao.update(producer);		
	}

	public void deleteProducer(Integer id) {
		producerDao.deleteById(id);
	}

}
