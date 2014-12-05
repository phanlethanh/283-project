package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.CartProductDao;
import com.onlinestore.model.CartProduct;
import com.onlinestore.service.CartProductService;

@Service("cartProductService")
@Transactional
public class CartProductServiceImpl implements CartProductService {

	@Autowired
	private CartProductDao cpDao;
	
	@Override
	public void createCartProduct(CartProduct cartProduct) {
		cpDao.create(cartProduct);
	}

	@Override
	public List<CartProduct> getCategories() {
		return cpDao.getAll();
	}

	@Override
	public CartProduct getCartProduct(Integer id) {
		return cpDao.get(id);
	}

	@Override
	public void updateCartProduct(CartProduct cartProduct) {
		cpDao.update(cartProduct);
	}

	@Override
	public void deleteCartProduct(Integer id) {
		cpDao.deleteById(id);
	}

}
