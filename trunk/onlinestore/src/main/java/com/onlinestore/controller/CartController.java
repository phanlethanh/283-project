package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.CartProduct;
import com.onlinestore.service.CartService;

@Controller
public class CartController {
	private CartService getCartService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CartService cartService = (CartService) appCtx.getBean("cartService");
		return cartService;
	}

	@RequestMapping(value = "/viewCart")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		Integer userId = null;
		try {
			userId = Integer.valueOf(request.getParameter("user_id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<CartProduct> cartProducts = getCartService()
				.getProductList(userId);
		List<HashMap<String, Object>> cpMapList = new ArrayList<HashMap<String, Object>>();
		for (int i = 0; i < cartProducts.size(); i++) {
			CartProduct cp = cartProducts.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", cp.getId());
			map.put("productId", cp.getProduct().getId());
			map.put("productName", cp.getProduct().getName());
			map.put("quantity", cp.getQuantity());
			map.put("price", cp.getProduct().getPrice().getPrice());
			cpMapList.add(map);
		}
		view.addObject("cpMapList", cpMapList);
		view.setViewName(viewName);
		return view;
	}
}
