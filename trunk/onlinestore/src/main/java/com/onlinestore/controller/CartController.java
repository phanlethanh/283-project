package com.onlinestore.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
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
import com.onlinestore.model.Product;
import com.onlinestore.util.Variable;

@Controller
public class CartController extends OsController {

	@RequestMapping(value = "/viewCart")
	public ModelAndView viewCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> cpMapList = null;
		List<CartProduct> cartProducts = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			Object obj = session
					.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST);
			if (obj == null) {
				cpMapList = new ArrayList<HashMap<String, Object>>();
			} else {
				// Get cpMapList object from session
				cpMapList = (List<HashMap<String, Object>>) obj;
			}
		} else {
			// Logged in
			cpMapList = new ArrayList<HashMap<String, Object>>();
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			cartProducts = getCartService().getProductList(userId);
			for (int i = 0; i < cartProducts.size(); i++) {
				CartProduct cp = cartProducts.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", cp.getId());
				map.put("productId", cp.getProduct().getId());
				map.put("productName", cp.getProduct().getName());
				map.put("productIcon", cp.getProduct().getIcon());
				map.put("quantity", cp.getQuantity());
				double tempPrice = cp.getProduct().getPrice().getPrice();
				map.put("price",
						String.format(Variable.CURRENCY_FORMAT, tempPrice));
				cpMapList.add(map);
			}
		}
		// calculate money
		double totalMoney = 0;
		double transportFee = 0;
		double totalPayment = 0;
		double price = 0;
		int sizeMap = cpMapList.size();
		int tempQuantity = 0;
		for (int i = 0; i < sizeMap; i++) {
			price = Double.parseDouble(cpMapList.get(i).get("price").toString()
					.replace(",", "")); // 23,000,000 => 23000000
			tempQuantity = Integer.parseInt(cpMapList.get(i).get("quantity")
					.toString());
			totalMoney += price * tempQuantity;
		}
		Double totalMoneyUsd = totalMoney/Variable.USD_VND;
		NumberFormat formatter = new DecimalFormat("#0.00");  
		totalMoneyUsd = Double.parseDouble(formatter.format(totalMoneyUsd));
		totalPayment = totalMoney + transportFee; // thanh toan
		view.addObject("cpMapList", cpMapList);
		view.addObject("totalMoney",
				String.format(Variable.CURRENCY_FORMAT, totalMoney));
		view.addObject("transportFee",
				String.format(Variable.CURRENCY_FORMAT, transportFee));
		view.addObject("totalPayment",
				String.format(Variable.CURRENCY_FORMAT, totalPayment));
		view.addObject("totalMoneyUsd",totalMoneyUsd);
		session.setAttribute(Variable.SESSION_CART_NUMBER, sizeMap);
		session.setAttribute(Variable.SESSION_CART_PRICE, totalMoney);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/addToCart")
	public ModelAndView addToCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = null;
		Integer productId = Integer.valueOf(request.getParameter("product_id"));
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			Object obj = session
					.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST);
			List<HashMap<String, Object>> cpMapList = null;
			if (obj == null) {
				cpMapList = new ArrayList<HashMap<String, Object>>();
			} else {
				// Get cpMapList object from session
				cpMapList = (List<HashMap<String, Object>>) obj;
			}
			// add product to map list
			HashMap<String, Object> map = new HashMap<String, Object>();
			Product p = getProductService().getProduct(productId);
			map.put("id", p.getId());
			map.put("productId", p.getId());
			map.put("productName", p.getName());
			map.put("productIcon", p.getIcon());
			map.put("quantity", 1);
			double tempPrice = p.getPrice().getPrice();
			map.put("price", String.format(Variable.CURRENCY_FORMAT, tempPrice));
			cpMapList.add(map);
			// Set cpMapList object to session
			session.setAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST,
					cpMapList);
		} else {
			// Logged in
			userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			// Get Cart from user_id, Product from product_id
			Cart cart = getUserService().getOsUser(userId).getCart();
			Product product = new Product();
			product.setId(productId);
			// Add CartProduct
			CartProduct cartProduct = new CartProduct();
			cartProduct.setCart(cart);
			cartProduct.setProduct(product);
			cartProduct.setQuantity(1);
			getCartProductService().createCartProduct(cartProduct);
		}
		return viewCart(request);
	}

	@RequestMapping(value = "/removeProductFromCart")
	public ModelAndView removeProductFromCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		view.addObject("cpMapList", null);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/getTermsAndConditions", method = RequestMethod.POST)
	public void getTermsAndConditions(HttpServletRequest request,
			HttpServletResponse response) {
		// UTF-8 Encoding issue
	}

	@RequestMapping(value = "/deleteCartProductFromCart", method = RequestMethod.POST)
	public void deleteCartProductFromCart(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cpId = request.getParameter("id");
		List<HashMap<String, Object>> cpMapList = null;
		List<CartProduct> cartProducts = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			Object obj = session
					.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST);
			if (obj == null) {
				cpMapList = new ArrayList<HashMap<String, Object>>();
			} else {
				// Get cpMapList object from session
				cpMapList = (List<HashMap<String, Object>>) obj;
				// delete product to map list
				int cpMapListSize = cpMapList.size();
				if (cpMapListSize > 0) {
					int index = 0;
					HashMap<String, Object> map = null;
					for (int i = 0; i < cpMapListSize; i++) {
						if (cpId.compareTo(cpMapList.get(i).get("id")
								.toString()) == 0) {
							index = i;
							map = cpMapList.get(i);
							break;
						}
					}
					cpMapList.remove(index);
				}
			}
			// Set cpMapList object to session
			session.setAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST,
					cpMapList);
		} else {
			// Logged in
			getCartProductService().deleteCartProduct(Integer.parseInt(cpId));
			// get cpMapList from database to calculate money
			cpMapList = new ArrayList<HashMap<String, Object>>();
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			cartProducts = getCartService().getProductList(userId);
			for (int i = 0; i < cartProducts.size(); i++) {
				CartProduct cp = cartProducts.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("quantity", cp.getQuantity());
				double tempPrice = cp.getProduct().getPrice().getPrice();
				map.put("price",
						String.format(Variable.CURRENCY_FORMAT, tempPrice));
				cpMapList.add(map);
			}
		}
		// calculate money
		double totalMoney = 0;
		double transportFee = 0;
		double totalPayment = 0;
		double price = 0;
		int sizeMap = cpMapList.size();
		int tempQuantity = 0;
		for (int i = 0; i < sizeMap; i++) {
			price = Double.parseDouble(cpMapList.get(i).get("price").toString()
					.replace(",", "")); // 23,000,000 => 23000000
			tempQuantity = Integer.parseInt(cpMapList.get(i).get("quantity")
					.toString());
			totalMoney += price * tempQuantity;
		}
		totalPayment = totalMoney + transportFee; // thanh toan

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 1);
		map.put("id", cpId);
		map.put("totalMoney",
				String.format(Variable.CURRENCY_FORMAT, totalMoney));
		map.put("transportFee",
				String.format(Variable.CURRENCY_FORMAT, transportFee));
		map.put("totalPayment",
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
