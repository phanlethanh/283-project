package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ConfigDao;
import com.onlinestore.model.Config;

@Repository
public class HbnConfigDao extends AbstractHbnDao<Config> implements ConfigDao {

}
