package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;











import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Product;
import com.onlinestore.util.Variable;

@Repository
public class HbnCategoryDao extends AbstractHbnDao<Category> implements
		CategoryDao {
	
	@Override
	public List<Category> getSubCategory(Integer parent) {
		// TODO Auto-generated method stub
		String sql = "from Category where parentId=:Id";
		Query query = getSession().createQuery(sql);
		query.setParameter("Id", parent);
		
		return query.list();
	}

	@Override
	public boolean findCategoryWithName(String name) {
		// TODO Auto-generated method stub
		String sql ="from Category where name=:name";
		Query query = getSession().createQuery(sql);
		query.setParameter("name", name);
		
		if(query.list().size() > 0)
			return true;
		return false;
	}
	@Override
	public List<Product> getProductOfCategory(Integer idCategory, Integer pageNumber) {
		// TODO Auto-generated method stub
	
		String sql = "select p from Product p, CategoryProduct cp where cp.category.id =:Id and cp.product.id = p.id";
		Query query = getSession().createQuery(sql);
		query.setParameter("Id", idCategory);
		query.setFirstResult(pageNumber * Variable.pageSize);
		query.setMaxResults( Variable.pageSize);
		//query.setParameter("pageSize",pageSize);
		System.out.print(query.list().size());
		return query.list();
		
	}

	@Override
	public Integer getTotalRow(Integer idCategory) {
		// TODO Auto-generated method stub
		String sql = "select p from Product p, CategoryProduct cp where cp.category.id =:Id and cp.product.id = p.id";
		Query query = getSession().createQuery(sql);
		query.setParameter("Id", idCategory);
		
		return query.list().size();
	}

	@Override
	public FieldsProduct getFieldsOfCategory(Integer id) {
		// TODO Auto-generated method stub
		String sql ="from Category where id=:Id";
		Query query = getSession().createQuery(sql);
		query.setParameter("Id", id);
		//String serial_data = query.list().get(0)
		if(query.list().size() > 0)
		{
			Category category =(Category) query.list().get(0);
			return category.getFieldsProduct();
		}
		return null;
	}

	@Override
	public List<Product> getProductOfCategory(Integer idCategory) {
		// TODO Auto-generated method stub
		String sql = "select p from Product p, CategoryProduct cp where cp.category.id =:Id and cp.product.id = p.id";
		Query query = getSession().createQuery(sql);
		query.setParameter("Id", idCategory);
		//query.setParameter("pageSize",pageSize);
		return query.list();
	}
	
}
