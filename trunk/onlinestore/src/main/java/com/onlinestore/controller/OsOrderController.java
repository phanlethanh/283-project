package com.onlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

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

	@RequestMapping(value = "/createOrderFromCart", method = RequestMethod.POST)
	public void createOrderFromCart(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			// Redirect to login
			map.put("code", 0);
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
				Product product = cp.getProduct();
				OsOrderDetail orderDetail = new OsOrderDetail();
				orderDetail.setOsOrder(order);
				orderDetail.setProduct(product);
				orderDetail.setQuantity(cp.getQuantity());
				orderDetail.setPrice(product.getPrice().getPrice());
				// Insert OsOrderDetail into database
				getOsOrderDetailService().createOsOrderDetail(orderDetail);
				// Delete cart product from cart
				getCartProductService().deleteCartProduct(cp.getId());
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
}
