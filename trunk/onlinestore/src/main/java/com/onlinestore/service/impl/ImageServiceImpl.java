package com.onlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.ImageDao;
import com.onlinestore.model.Image;
import com.onlinestore.service.ImageService;

@Service ("imageService")
@Transactional
public class ImageServiceImpl implements ImageService{

	@Autowired
	private ImageDao imageDao;
	@Override
	public void createImage(Image image) {
		// TODO Auto-generated method stub
		imageDao.create(image);
	}
	@Override
	public int getLastInsertId() {
		// TODO Auto-generated method stub
		return imageDao.getLastInsertId();
	}
	@Override
	public Image getImage(Integer id) {
		// TODO Auto-generated method stub
		return imageDao.get(id);
	}
	@Override
	public void update(Image image) {
		// TODO Auto-generated method stub
		imageDao.update(image);
	}
	@Override
	public void deleteImage(Image image) {
		// TODO Auto-generated method stub
		imageDao.delete(image);
	}
	
}
