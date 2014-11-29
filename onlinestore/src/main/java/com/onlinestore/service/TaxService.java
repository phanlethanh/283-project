package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Tax;

public interface TaxService {
	void createTax(Tax tax);
	
	List<Tax> getTaxes();
	
	Tax getTax(Long id);
	
	void updateTax(Tax tax);
	
	void deleteTax(Long id);
}
