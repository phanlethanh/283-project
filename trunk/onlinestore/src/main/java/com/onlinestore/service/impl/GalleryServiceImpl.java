package com.onlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlinestore.dao.GalleryDao;
import com.onlinestore.model.Gallery;
import com.onlinestore.service.GalleryService;
@Service("galleryService")
public class GalleryServiceImpl implements GalleryService{

	@Autowired
	private GalleryDao galleryDao;
	@Override
	public void createGallery(Gallery gallery) {
		// TODO Auto-generated method stub
		galleryDao.create(gallery);
	}
	
	
}
