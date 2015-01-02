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
			double tax = 0;
			double taxPayment = 0;
			int tempQuantity = 0;
			int totalQuantity = 0; // tong so luong san pham
			int detailListSize = orderDetailList.size();
			for (int i = 0; i < detailListSize; i++) {
				OsOrderDetail orderDetail = orderDetailList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", orderDetail.getId());
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
			tax = order.getTax().getValue();
			taxPayment = (totalPayment * tax) / 100;
			totalPayment += taxPayment; // thue
			view.addObject("totalMoney",
					String.format(Variable.CURRENCY_FORMAT, totalMoney));
			view.addObject("taxPayment",
					String.format(Variable.CURRENCY_FORMAT, taxPayment));
			view.addObject("totalPayment",
					String.format(Variable.CURRENCY_FORMAT, totalPayment));
		}
		view.addObject("orderDetailMapList", orderDetailMapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/deleteOrderDetailItem", method = RequestMethod.POST)
	public void deleteOrderDetailItem(HttpServletRequest request,
			HttpServletResponse response) {
		int orderDetailId = Integer.parseInt(request.getParameter("id"));
		// Get order id from order detail
		OsOrderDetail orderDetail = getOsOrderDetailService().getOsOrderDetail(
				orderDetailId);
		OsOrder order = orderDetail.getOsOrder();
		int orderId = order.getId();
		// Delete order detail
		getOsOrderDetailService().deleteOsOrderDetail(orderDetailId);
		// Caculate money
		List<OsOrderDetail> orderDetailList = null;
		orderDetailList = getOsOrderDetailService()
				.getOrderDetailListByOrderId(orderId);
		double totalMoney = 0;
		double transportFee = 0;
		double totalPayment = 0;
		double price = 0;
		double tax = 0;
		double taxPayment = 0;
		int tempQuantity = 0;
		int totalQuantity = 0; // tong so luong san pham
		int detailListSize = orderDetailList.size();
		for (int i = 0; i < detailListSize; i++) {
			OsOrderDetail temp = orderDetailList.get(i);
			tempQuantity = temp.getQuantity();
			price = temp.getPrice();
			totalMoney += price * tempQuantity;
			totalQuantity += tempQuantity;
		}
		// Update total_price of order after deleting order_detail
		order.setOsUser(order.getOsUser());
		order.setStatus(order.getStatus());
		order.setTax(order.getTax());
		order.setTransportFee(order.getTransportFee());
		order.setTotalPrice(totalMoney);
		order.setAddress(order.getAddress());
		order.setPhone(order.getPhone());
		order.setCreateDate(order.getCreateDate());
		order.setActive(order.getActive());
		
		getOsOrderService().updateOsOrder(order);
		
		transportFee = order.getTransportFee().getPrice();
		totalPayment = totalMoney + transportFee; // thanh toan
		tax = order.getTax().getValue();
		taxPayment = (totalPayment * tax) / 100;
		totalPayment += taxPayment; // thue
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", orderDetailId);
		map.put("transport_fee",
				String.format(Variable.CURRENCY_FORMAT, transportFee));
		map.put("total_product", totalQuantity);
		map.put("total_money",
				String.format(Variable.CURRENCY_FORMAT, totalMoney));
		map.put("tax_payment",
				String.format(Variable.CURRENCY_FORMAT, taxPayment));
		map.put("total_payment",
				String.format(Variable.CURRENCY_FORMAT, totalPayment));
		
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
