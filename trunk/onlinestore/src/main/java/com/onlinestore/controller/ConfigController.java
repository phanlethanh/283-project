package com.onlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.onlinestore.model.Config;
import com.onlinestore.util.Variable;

@Controller
public class ConfigController extends OsController {
	@RequestMapping(value = "/viewConfigInfo")
	public ModelAndView viewConfigInfo(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "configInfo";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> configInfoMapList = new ArrayList<HashMap<String, Object>>();
		List<Config> configInfoList = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			viewName = "error";
		} else {
			// Check user id admin
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			if (getUserService().isAdminUser(userId)) {
				configInfoList = getConfigService().getConfigs();
				// Set configInfoList to configInfoMapList
				int size = configInfoList.size();
				System.out.println(size);
				for (int i = 0; i < size; i++) {
					Config config = configInfoList.get(i);
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("id", config.getId());
					map.put("name", config.getName());
					map.put("data_type", config.getDataType());
					map.put("value", config.getValue());
					configInfoMapList.add(map);
				}
			} else {
				viewName = "error";
			}
		}
		view.addObject("configInfoMapList", configInfoMapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/adminDetailConfigInfo", method = RequestMethod.POST)
	public void adminDetailConfigInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String configId = request.getParameter("id");
		Config config = null;
		config = getConfigService().getConfig(Integer.parseInt(configId));
		HashMap<String, Object> configInfoMap = new HashMap<String, Object>();
		configInfoMap.put("id", config.getId());
		configInfoMap.put("name", config.getName());
		configInfoMap.put("value", config.getValue());
		configInfoMap.put("data_type", config.getDataType());
		
		String json = new Gson().toJson(configInfoMap);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/adminEditConfigInfo", method = RequestMethod.POST)
	public void adminEditConfigInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("config_id");
		String name = request.getParameter("config_name");
		String value = request.getParameter("config_value");
		String dataType = request.getParameter("config_data_type");
		Config config = new Config();
		config.setId(Integer.parseInt(id));
		config.setName(name);
		config.setValue(value);
		config.setDataType(dataType);
		// Update config info
		getConfigService().updateConfig(config);
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("code", 1);
		map.put("id", id);
		map.put("new_value", value);
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
