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

	
	private ProducerDao producerDao;
	
	public void createProducer(Producer producer) {
		producerDao.create(producer);		
	}

	public List<Producer> getProducers() {
		return producerDao.getAll();
	}

	public Producer getProducer(Long id) {
		return producerDao.get(id);
	}

	public void updateProducer(Producer producer) {
		producerDao.update(producer);		
	}

	public void deleteProducer(Long id) {
		producerDao.deleteById(id);
	}

}
