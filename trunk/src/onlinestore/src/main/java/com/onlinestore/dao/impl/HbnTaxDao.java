package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.TaxDao;
import com.onlinestore.model.Tax;

@Repository
public class HbnTaxDao extends AbstractHbnDao<Tax> implements TaxDao {

}
