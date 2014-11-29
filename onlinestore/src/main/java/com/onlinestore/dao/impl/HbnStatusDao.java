package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.StatusDao;
import com.onlinestore.model.Status;

@Repository
public class HbnStatusDao extends AbstractHbnDao<Status> implements StatusDao {

}
