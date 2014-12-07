package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.OsOrder;
import com.onlinestore.service.OsOrderService;
import com.onlinestore.util.Variable;

@Controller
public class OsOrderController {
	private OsOrderService getOsOrderService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsOrderService osOrderService = (OsOrderService) appCtx
				.getBean("osOrderService");
		return osOrderService;
	}

	@RequestMapping(value = "/viewOrderList")
	public ModelAndView viewOrderList(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "order";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> orderMapList = new ArrayList<HashMap<String, Object>>();
		List<OsOrder> orderList = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			// Ignore because user does not see view-order menu
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			// Get orderList from user id
			orderList = getOsOrderService().getOrderListByUserId(userId);
			// Set orderList to orderMapList
			for (int i = 0; i < orderList.size(); i++) {
				OsOrder order = orderList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", order.getId());
				map.put("status", order.getStatus().getName());
				map.put("transportFee", order.getTransportFee().getPrice());
				map.put("taxName", order.getTax().getName());
				map.put("taxValue", order.getTax().getValue());
				map.put("address", order.getAddress());
				map.put("phone", order.getPhone());
				orderMapList.add(map);
			}
		}
		view.addObject("orderMapList", orderMapList);
		view.setViewName(viewName);
		return view;
	}
}
