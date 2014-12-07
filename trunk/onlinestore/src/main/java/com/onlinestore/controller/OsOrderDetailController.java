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

import com.onlinestore.model.OsOrderDetail;
import com.onlinestore.service.OsOrderDetailService;
import com.onlinestore.util.Variable;

@Controller
public class OsOrderDetailController {
	private OsOrderDetailService getOsOrderDetailService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsOrderDetailService osOrderDetailService = (OsOrderDetailService) appCtx
				.getBean("osOrderDetailService");
		return osOrderDetailService;
	}

	@RequestMapping(value = "/viewOrderDetail")
	public ModelAndView viewOrderList(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "orderDetail";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> orderDetailMapList = new ArrayList<HashMap<String, Object>>();
		List<OsOrderDetail> orderDetailList = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			// Ignore because user does not see view-order-detail menu
		} else {
			// Logged in
			// Get orderList from order id
			Integer orderId = Integer.valueOf(request
					.getParameter(Variable.REQUEST_ORDER_ID));
			orderDetailList = getOsOrderDetailService()
					.getOrderDetailListByOrderId(orderId);
			// Set orderList to orderMapList
			for (int i = 0; i < orderDetailList.size(); i++) {
				OsOrderDetail orderDetail = orderDetailList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				//map.put("orderId", orderDetail.getOsOrder().getId());
				map.put("productId", orderDetail.getProduct().getId());
				map.put("productName", orderDetail.getProduct().getName());
				map.put("productIcon", orderDetail.getProduct().getIcon());
				map.put("quantity", orderDetail.getQuantity());
				map.put("price", orderDetail.getPrice());
				orderDetailMapList.add(map);
			}
		}
		view.addObject("orderDetailMapList", orderDetailMapList);
		view.setViewName(viewName);
		return view;
	}
}
