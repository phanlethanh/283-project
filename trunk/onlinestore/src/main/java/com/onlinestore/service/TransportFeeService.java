package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.TransportFee;

public interface TransportFeeService {
	Integer createTransportFee(TransportFee transportFee);
	
	List<TransportFee> getTransportFees();
	
	TransportFee getTransportFee(Integer id);
	
	void updateTransportFee(TransportFee transportFee);
	
	void deleteTransportFee(Integer id);
}
