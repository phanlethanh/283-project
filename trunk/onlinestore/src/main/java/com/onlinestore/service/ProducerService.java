package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Producer;

public interface ProducerService {
	void createProducer(Producer producer);
	
	List<Producer> getProducers();
	
	Producer getProducer(Long id);
	
	void updateProducer(Producer producer);
	
	void deleteProducer(Long id);
}
