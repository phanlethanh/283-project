package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Config;

public interface ConfigService {
	Integer createConfig(Config config);
	
	List<Config> getConfigs();
	
	Config getConfig(Integer id);
	
	void updateConfig(Config config);
	
	void deleteConfig(Integer id);
}
