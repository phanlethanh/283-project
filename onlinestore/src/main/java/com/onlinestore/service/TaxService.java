package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Tax;

public interface TaxService {
	Integer createTax(Tax tax);
	
	List<Tax> getTaxes();
	
	Tax getTax(Integer id);
	
	void updateTax(Tax tax);
	
	void deleteTax(Integer id);
}
