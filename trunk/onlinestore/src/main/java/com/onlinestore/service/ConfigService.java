package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Config;

public interface ConfigService {
	void createConfig(Config config);
	
	List<Config> getConfigs();
	
	Config getConfig(Long id);
	
	void updateConfig(Config config);
	
	void deleteConfig(Long id);
}
