package com.onlinestore.dao;

import com.onlinestore.model.Image;

public interface ImageDao extends Dao<Image> {
	Integer getLastInsertId();
}
