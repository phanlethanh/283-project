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
import com.onlinestore.util.Variable;

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
		HttpSession session = request.getSession();
		List<HashMap<String, Object>> cpMapList = null;
		List<CartProduct> cartProducts = null;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			Object obj = session
					.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST);
			if (obj == null) {
				// Ignore because cpMapList defined
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
				map.put("quantity", cp.getQuantity());
				map.put("price", cp.getProduct().getPrice().getPrice());
				cpMapList.add(map);
			}
		}
		view.addObject("cpMapList", cpMapList);
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
			map.put("id", cpMapList.size());
			map.put("productId", p.getId());
			map.put("productName", p.getName());
			map.put("quantity", 1);
			map.put("price", p.getPrice().getPrice());
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
}
