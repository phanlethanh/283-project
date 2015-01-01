package com.onlinestore.dao;

import com.onlinestore.model.Price;

public interface PriceDao extends Dao<Price>{
	Price getLastPriceInsert();
}
