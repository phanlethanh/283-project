package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.PromotionDao;
import com.onlinestore.model.Promotion;

@Repository
public class HbnPromotionDao extends AbstractHbnDao<Promotion> implements
		PromotionDao {

}
