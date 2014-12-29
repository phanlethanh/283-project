package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.CartProduct;


public interface CartProductService {
	Integer createCartProduct(CartProduct cartProduct);

	List<CartProduct> getCartProducts();

	CartProduct getCartProduct(Integer id);

	void updateCartProduct(CartProduct cartProduct);

	void deleteCartProduct(Integer id);
	
	List<CartProduct> getCartProductsByCartId(Integer cartId);
}
