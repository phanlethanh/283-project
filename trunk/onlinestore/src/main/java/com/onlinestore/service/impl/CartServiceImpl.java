package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.service.CartService;
import com.onlinestore.dao.CartDao;
import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	
	@Override
	public Integer createCart(Cart cart) {
		return (Integer) cartDao.create(cart);
	}

	@Override
	public List<Cart> getCategories() {
		return cartDao.getAll();
	}

	@Override
	public Cart getCart(Integer id) {
		return cartDao.get(id);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDao.update(cart);
	}

	@Override
	public void deleteCart(Integer id) {
		cartDao.deleteById(id);
	}

	@Override
	public List<CartProduct> getProductList(Integer userId) {
		return cartDao.getProductList(userId);
	}
	
}
