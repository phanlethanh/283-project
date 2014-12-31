package com.onlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.GalleryDao;
import com.onlinestore.model.Gallery;
import com.onlinestore.service.GalleryService;
@Service("galleryService")
@Transactional
public class GalleryServiceImpl implements GalleryService{

	@Autowired
	private GalleryDao galleryDao;
	@Override
	public void createGallery(Gallery gallery) {
		// TODO Auto-generated method stub
		galleryDao.create(gallery);
	}
	@Override
	public Gallery getLastInsertId() {
		// TODO Auto-generated method stub
		return galleryDao.getLastInsertId();
	}
	
	
}
