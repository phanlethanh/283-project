package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Producer;

public interface ProducerService {
	Integer createProducer(Producer producer);
	
	List<Producer> getProducers();
	
	Producer getProducer(Integer id);
	
	void updateProducer(Producer producer);
	
	void deleteProducer(Integer id);
}
