package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.OsOrder;
import com.onlinestore.model.OsOrderDetail;
import com.onlinestore.util.Variable;

@Controller
public class OsOrderDetailController extends OsController {

	@RequestMapping(value = "/viewOrderDetail")
	public ModelAndView viewOrderList(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "orderDetail";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> orderDetailMapList = new ArrayList<HashMap<String, Object>>();
		List<OsOrderDetail> orderDetailList = null;
		OsOrder order = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			// Ignore because user does not see view-order-detail menu
			viewName = "error";
		} else {
			// Logged in
			// Get orderList from order id
			Integer orderId = Integer.valueOf(request
					.getParameter(Variable.REQUEST_ORDER_ID));
			order = getOsOrderService().getOsOrder(orderId);
			orderDetailList = getOsOrderDetailService()
					.getOrderDetailListByOrderId(orderId);
			// Set orderList to orderMapList
			// calculate money
			double totalMoney = 0;
			double transportFee = 0;
			double totalPayment = 0;
			double price = 0;
			int tempQuantity = 0;
			int totalQuantity = 0; // tong so luong san pham
			int detailListSize = orderDetailList.size();
			for (int i = 0; i < detailListSize; i++) {
				OsOrderDetail orderDetail = orderDetailList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				// map.put("orderId", orderDetail.getOsOrder().getId());
				map.put("productId", orderDetail.getProduct().getId());
				map.put("productName", orderDetail.getProduct().getName());
				map.put("productIcon", orderDetail.getProduct().getIcon());
				tempQuantity = orderDetail.getQuantity();
				map.put("quantity", tempQuantity);
				price = orderDetail.getPrice();
				map.put("price", String.format(Variable.CURRENCY_FORMAT, price));
				orderDetailMapList.add(map);
				totalMoney += price * tempQuantity;
				totalQuantity += tempQuantity;
			}
			view.addObject("status", order.getStatus().getName());
			transportFee = order.getTransportFee().getPrice();
			view.addObject("transportFee",
					String.format(Variable.CURRENCY_FORMAT, transportFee));
			view.addObject("taxName", order.getTax().getName());
			view.addObject("taxValue", order.getTax().getValue());
			view.addObject("totalProduct", totalQuantity);
			totalPayment = totalMoney + transportFee; // thanh toan
			view.addObject("totalMoney",
					String.format(Variable.CURRENCY_FORMAT, totalMoney));
			view.addObject("totalPayment",
					String.format(Variable.CURRENCY_FORMAT, totalPayment));
		}
		view.addObject("orderDetailMapList", orderDetailMapList);
		view.setViewName(viewName);
		return view;
	}
}
