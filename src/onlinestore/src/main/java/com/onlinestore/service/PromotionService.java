package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Promotion;

public interface PromotionService {
	void createPromotion(Promotion promotion);
	
	List<Promotion> getPromotions();
	
	Promotion getPromotion(Long id);
	
	void updatePromotion(Promotion promotion);
	
	void deletePromotion(Long id);
}
