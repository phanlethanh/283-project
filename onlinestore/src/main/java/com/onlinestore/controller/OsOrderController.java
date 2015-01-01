package com.onlinestore.controller;

import java.io.IOException;
import java.text.DateFormat;
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
import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;
import com.onlinestore.model.OsOrder;
import com.onlinestore.model.OsOrderDetail;
import com.onlinestore.model.OsUser;
import com.onlinestore.model.Product;
import com.onlinestore.model.Status;
import com.onlinestore.model.Tax;
import com.onlinestore.model.TransportFee;
import com.onlinestore.util.Variable;

@Controller
public class OsOrderController extends OsController {

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
			viewName = "error";
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			// Get orderList from user id
			orderList = getOsOrderService().getOrderListByUserId(userId);
			// Set orderList to orderMapList
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < orderList.size(); i++) {
				OsOrder order = orderList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", order.getId());
				map.put("status", order.getStatus().getName());
				map.put("createDate", df.format(order.getCreateDate()));
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

	@RequestMapping(value = "/createOrderFromCart", method = RequestMethod.POST)
	public void createOrderFromCart(HttpServletRequest request,
			HttpServletResponse response) {
		// double minPayment = Double.parseDouble(getConfigService().getConfig(
		// Variable.ID_MIN_PAYMENT).getValue());
		// double maxPayment = Double.parseDouble(getConfigService().getConfig(
		// Variable.ID_MAX_PAYMENT).getValue());
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			// Redirect to login
			map.put("code", 0); // not login
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			// create order
			OsUser user = getUserService().getOsUser(userId);
			Status status = new Status();
			status.setId(Variable.ID_NEW_ORDER_STATUS); // New Status
			TransportFee tfee = new TransportFee();
			tfee.setId(Variable.ID_ZERO_TRANSPORT_FEE); // 0
			Tax tax = new Tax();
			tax.setId(Variable.ID_VAT_TAX);
			OsOrder order = new OsOrder();
			order.setOsUser(user);
			order.setStatus(status);
			order.setTransportFee(tfee);
			order.setTax(tax);
			order.setAddress(user.getAddress());
			order.setPhone(user.getPhone());
			// Insert into database
			Integer orderId = getOsOrderService().createOsOrder(order);
			order.setId(orderId);
			// Create order detail
			// Get product id list from cart
			Cart cart = user.getCart();
			List<CartProduct> cartProducts = getCartProductService()
					.getCartProductsByCartId(cart.getId());
			int cartProductSize = cartProducts.size();
			for (int i = 0; i < cartProductSize; i++) {
				CartProduct cp = cartProducts.get(i);
				int cpId = cp.getId();
				Product product = cp.getProduct();
				OsOrderDetail orderDetail = new OsOrderDetail();
				orderDetail.setOsOrder(order);
				orderDetail.setProduct(product);
				// orderDetail.setQuantity(cp.getQuantity());
				Integer quantity = Integer.valueOf(request
						.getParameter("quantity_" + cpId));
				orderDetail.setQuantity(quantity);
				orderDetail.setPrice(product.getPrice().getPrice());
				// Insert OsOrderDetail into database
				getOsOrderDetailService().createOsOrderDetail(orderDetail);
				// Delete cart product from cart
				getCartProductService().deleteCartProduct(cpId);
			}
			map.put("code", 1);
		}
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/orderDetail", method = RequestMethod.POST)
	public void orderDetail(HttpServletRequest request,
			HttpServletResponse response) {
		String orderId = request.getParameter("id");
		OsOrder order = getOsOrderService().getOsOrder(
				Integer.parseInt(orderId));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", orderId);
		map.put("status", order.getStatus().getName());
		map.put("create_date", df.format(order.getCreateDate()));
		map.put("address", order.getAddress());
		map.put("phone", order.getPhone());
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/editOrder", method = RequestMethod.POST)
	public void editOrder(HttpServletRequest request,
			HttpServletResponse response) {
		String orderId = request.getParameter("order_id");
		String address = request.getParameter("order_address");
		String phone = request.getParameter("order_phone");
		// Get order
		OsOrder order = getOsOrderService().getOsOrder(
				Integer.parseInt(orderId));
		order.setAddress(address);
		order.setPhone(phone);
		// Update
		getOsOrderService().updateOsOrder(order);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 1);
		map.put("id", orderId);
		map.put("address", address);
		map.put("phone", phone);
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public void deleteOrder(HttpServletRequest request,
			HttpServletResponse response) {
		int orderId = Integer.parseInt(request.getParameter("id"));
		// Delete order detail
		getOsOrderDetailService().deleteByOrderId(orderId);
		// Delete order
		getOsOrderService().deleteOsOrder(orderId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", orderId);
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/confirmOrder", method = RequestMethod.POST)
	public void confirmOrder(HttpServletRequest request,
			HttpServletResponse response) {
		HashMap<String, Object> map = new HashMap<String, Object>();
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
