package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.TransportFee;

public interface TransportFeeService {
	void createTransportFee(TransportFee transportFee);
	
	List<TransportFee> getTransportFees();
	
	TransportFee getTransportFee(Long id);
	
	void updateTransportFee(TransportFee transportFee);
	
	void deleteTransportFee(Long id);
}
