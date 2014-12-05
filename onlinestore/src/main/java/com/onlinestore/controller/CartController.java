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

import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;
import com.onlinestore.model.Product;
import com.onlinestore.service.CartProductService;
import com.onlinestore.service.CartService;
import com.onlinestore.service.OsUserService;
import com.onlinestore.service.ProductService;

@Controller
public class CartController {

	private CartService getCartService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CartService cartService = (CartService) appCtx.getBean("cartService");
		return cartService;
	}

	private OsUserService getUserService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsUserService userService = (OsUserService) appCtx
				.getBean("osUserService");
		return userService;
	}

	private ProductService getProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProductService productService = (ProductService) appCtx
				.getBean("productService");
		return productService;
	}

	private CartProductService getCartProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CartProductService cartProductService = (CartProductService) appCtx
				.getBean("cartProductService");
		return cartProductService;
	}

	@RequestMapping(value = "/viewCart")
	public ModelAndView viewCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		String userIdStr = request.getParameter("user_id");
		List<HashMap<String, Object>> cpMapList = new ArrayList<HashMap<String, Object>>();
		List<CartProduct> cartProducts = null;
		if (userIdStr.equals("null")) {
			// Not login
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("cartProducts");
			if (obj == null) {
				cartProducts = new ArrayList<CartProduct>();
			} else {
				cartProducts = (List<CartProduct>) obj;
			}
		} else {
			// Logged in
			Integer userId = Integer.valueOf(request.getParameter("user_id"));
			cartProducts = getCartService().getProductList(userId);
		}
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

	@RequestMapping(value = "/addToCart")
	public ModelAndView addToCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		String userIdStr = request.getParameter("user_id");
		Integer userId = null;
		Integer productId = Integer.valueOf(request.getParameter("product_id"));
		if (userIdStr.equals("null")) {
			// Not login
			userId = null;
			System.out.println("user not log in");
		} else {
			// Logged in
			userId = Integer.valueOf(userIdStr);
			// Get Cart from user_id, Product from product_id
			Cart cart = getUserService().getOsUser(userId).getCart();
			// cart.set
			Product product = new Product();
			product.setId(productId);
			// Add CartProduct
			CartProduct cartProduct = new CartProduct();
			cartProduct.setCart(cart);
			cartProduct.setProduct(product);
			cartProduct.setQuantity(1);
			getCartProductService().createCartProduct(cartProduct);
		}
		// Get product list of cart
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

	@RequestMapping(value = "/removeProductFromCart")
	public ModelAndView removeProductFromCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "cart";
		view.addObject("cpMapList", null);
		view.setViewName(viewName);
		return view;
	}
}
