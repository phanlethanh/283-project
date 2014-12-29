package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Promotion;

public interface PromotionService {
	Integer createPromotion(Promotion promotion);
	
	List<Promotion> getPromotions();
	
	Promotion getPromotion(Integer id);
	
	void updatePromotion(Promotion promotion);
	
	void deletePromotion(Integer id);
	
	List<Promotion> getPromotionList();
}
