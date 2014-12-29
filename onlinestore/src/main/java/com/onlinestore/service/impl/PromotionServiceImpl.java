package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.PromotionDao;
import com.onlinestore.model.Promotion;
import com.onlinestore.service.PromotionService;

@Service("promotionService")
@Transactional
public class PromotionServiceImpl implements PromotionService {

	@Autowired
	private PromotionDao promotionDao;
	
	public Integer createPromotion(Promotion promotion) {
		return (Integer) promotionDao.create(promotion);
	}

	public List<Promotion> getPromotions() {
		return promotionDao.getAll();
	}

	public Promotion getPromotion(Integer id) {
		return promotionDao.get(id);
	}

	public void updatePromotion(Promotion promotion) {
		promotionDao.update(promotion);
	}

	public void deletePromotion(Integer id) {
		promotionDao.deleteById(id);
	}

	@Override
	public List<Promotion> getPromotionList() {
		// TODO Auto-generated method stub
		return null;
	}

}
