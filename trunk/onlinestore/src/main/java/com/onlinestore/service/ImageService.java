package com.onlinestore.service;

import com.onlinestore.model.Image;

public interface ImageService {
	void createImage(Image image);
	int getLastInsertId();
}
