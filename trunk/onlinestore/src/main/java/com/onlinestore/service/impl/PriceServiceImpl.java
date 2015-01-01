package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.PriceDao;
import com.onlinestore.model.Price;
import com.onlinestore.service.PriceService;

@Service("priceService")
@Transactional
public class PriceServiceImpl implements PriceService {

	@Autowired
	private PriceDao priceDao;

	public Integer createPrice(Price price) {
		return (Integer) priceDao.create(price);
	}

	public List<Price> getPrices() {
		return priceDao.getAll();
	}

	public Price getPrice(Integer id) {
		return priceDao.get(id);
	}

	public void updatePrice(Price price) {
		priceDao.update(price);
	}

	public void deletePrice(Integer id) {
		priceDao.deleteById(id);
	}

	@Override
	public Price getLastPriceInsert() {
		// TODO Auto-generated method stub
		return priceDao.getLastPriceInsert();
	}

}
