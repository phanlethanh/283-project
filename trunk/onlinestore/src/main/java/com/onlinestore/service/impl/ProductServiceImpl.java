package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.ProductDao;
import com.onlinestore.model.Product;
import com.onlinestore.service.ProductService;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	public Integer createProduct(Product product) {
		return (Integer) productDao.create(product);
	}

	public List<Product> getProducts() {
		return productDao.getAll();
	}

	public Product getProduct(Integer id) {
		return productDao.get(id);
	}

	public void updateProduct(Product product) {
		productDao.update(product);
	}

	public void deleteProduct(Integer id) {
		productDao.deleteById(id);
	}

	public List<Product> getHomeProducts() {
		return productDao.getHomeProducts();
	}

	@Override
	public List<Product> search(String keyword) {
		return productDao.search(keyword);
	}

	@Override
	public Product getLastInsertId() {
		// TODO Auto-generated method stub
		return productDao.getLastInsertId();
	}

}
