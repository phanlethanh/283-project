package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;

public interface CartService {
	Integer createCart(Cart cart);

	List<Cart> getCategories();

	Cart getCart(Integer id);

	void updateCart(Cart cart);

	void deleteCart(Integer id);
	
	List<CartProduct> getProductList(Integer userId);
	
	Integer getProductCount(Integer userId);
	
	Double getProductPriceSum(Integer userId);
}
