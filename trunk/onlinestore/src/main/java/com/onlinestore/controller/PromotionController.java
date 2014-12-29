package com.onlinestore.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.onlinestore.model.Promotion;
import com.onlinestore.util.Variable;

@Controller
public class PromotionController extends OsController {

	@RequestMapping(value = "/viewPromotionList")
	public ModelAndView viewPromotionList(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "promotion";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> promotionMapList = new ArrayList<HashMap<String, Object>>();
		List<Promotion> promotionList = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			viewName = "error";
		} else {
			// Check user id admin
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			if (getUserService().isAdminUser(userId)) {
				promotionList = getPromotionService().getPromotions();
				// Set promotionList to promotionMapList
				int size = promotionList.size();
				for (int i = 0; i < size; i++) {
					Promotion promotion = promotionList.get(i);
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("id", promotion.getId());
					map.put("name", promotion.getName());
					map.put("type_promotion", promotion.getTypePromotion());
					map.put("description", promotion.getDescription());
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					map.put("start_date", dateFormat.format(promotion.getStartDate()));
					map.put("end_date", dateFormat.format(promotion.getEndDate()));
					promotionMapList.add(map);
				}
			} else {
				viewName = "error";
			}
		}
		view.addObject("promotionMapList", promotionMapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/adminDetailPromotion", method = RequestMethod.POST)
	public void adminDetailPromotion(HttpServletRequest request,
			HttpServletResponse response) {
		String promotionId = request.getParameter("id");
		Promotion promotion = null;
		promotion = getPromotionService().getPromotion(
				Integer.parseInt(promotionId));
		HashMap<String, Object> promotionMap = new HashMap<String, Object>();
		promotionMap.put("id", promotion.getId());
		promotionMap.put("name", promotion.getName());
		promotionMap.put("type_promotion", promotion.getTypePromotion());
		promotionMap.put("description", promotion.getDescription());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		promotionMap.put("start_date", dateFormat.format(promotion.getStartDate()));
		promotionMap.put("end_date", dateFormat.format(promotion.getEndDate()));

		String json = new Gson().toJson(promotionMap);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/adminEditPromotion", method = RequestMethod.POST)
	public void adminEditPromotion(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("promotion_id");
		String name = request.getParameter("promotion_name");
		String typePromotion = request.getParameter("promotion_type");
		String startDate = request.getParameter("promotion_start_date");
		String endDate = request.getParameter("promotion_end_date");
		String description = request.getParameter("promotion_description");
		Promotion promotion = new Promotion();
		promotion.setId(Integer.parseInt(id));
		promotion.setName(name);
		promotion.setTypePromotion(typePromotion);
		promotion.setStartDate(Date.valueOf(startDate));
		promotion.setEndDate(Date.valueOf(endDate));
		promotion.setDescription(description);
		// Update promotion info
		getPromotionService().updatePromotion(promotion);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 1);
		map.put("id", id);
		map.put("name", name);
		map.put("type_promotion", typePromotion);
		map.put("description", description);
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/adminDeletePromotion", method = RequestMethod.POST)
	public void adminDeletePromotion(HttpServletRequest request,
			HttpServletResponse response) {
		String promotionId = request.getParameter("id");
		// Delete promotion
		getPromotionService().deletePromotion(Integer.parseInt(promotionId));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 1);
		map.put("id", promotionId);
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/adminAddPromotion", method = RequestMethod.POST)
	public void adminAddPromotion(HttpServletRequest request,
			HttpServletResponse response) {
		String name = request.getParameter("promotion_name");
		String typePromotion = request.getParameter("promotion_type");
		String startDate = request.getParameter("promotion_start_date");
		String endDate = request.getParameter("promotion_end_date");
		String description = request.getParameter("promotion_description");
		Promotion promotion = new Promotion();
		promotion.setName(name);
		promotion.setTypePromotion(typePromotion);
		promotion.setStartDate(Date.valueOf(startDate));
		promotion.setEndDate(Date.valueOf(endDate));
		promotion.setDescription(description);
		// Add promotion
		getPromotionService().createPromotion(promotion);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 1);
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
