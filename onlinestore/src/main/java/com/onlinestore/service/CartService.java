package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;

public interface CartService {
	void createCart(Cart cart);

	List<Cart> getCategories();

	Cart Cart(Integer id);

	void updateCart(Cart cart);

	void deleteCart(Integer id);
	
	List<CartProduct> getProductList(Integer userId);
}
