package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Price;

public interface PriceService {
	void createPrice(Price price);
	
	List<Price> getPrices();
	
	Price getPrice(Long id);
	
	void updatePrice(Price price);
	
	void deletePrice(Long id);
}
