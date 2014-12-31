package com.onlinestore.dao;

import com.onlinestore.model.Gallery;

public interface GalleryDao extends Dao<Gallery>{
	
	Gallery getLastInsertId();
}
