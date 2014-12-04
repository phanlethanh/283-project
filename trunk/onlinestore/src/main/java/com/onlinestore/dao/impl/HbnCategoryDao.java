package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;




import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;

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
	
	
}
