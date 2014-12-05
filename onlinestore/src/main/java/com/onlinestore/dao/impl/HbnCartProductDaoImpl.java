package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CartProductDao;
import com.onlinestore.model.CartProduct;

@Repository
public class HbnCartProductDaoImpl extends AbstractHbnDao<CartProduct>
		implements CartProductDao {

}
