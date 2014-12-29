package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.GalleryDao;
import com.onlinestore.model.Gallery;
@Repository
@Transactional
public class HbnGalleryDao extends AbstractHbnDao<Gallery> implements GalleryDao{

}
