package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.Product;
import com.onlinestore.service.ProductService;

@Controller
public class HomeController {

	private ProductService getProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProductService productService = (ProductService) appCtx
				.getBean("productService");
		return productService;
	}

	@RequestMapping(value = "/homes")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		ck_user = getItemCookies(cookie, "os_username");
		if (ck_user != null) {
			if (ck_user.equals("admin"))
				viewName = "admin";
			HttpSession session = request.getSession();
			synchronized (session) {
				session.setAttribute("os_username", ck_user);
			}
		}

		// Select 'hot' and 'new' product to display in home page
		List<Product> homeProducts = getProductService().getHomeProducts();
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();

		request.setAttribute("message", "message");
		for (int i = 0; i < homeProducts.size(); i++) {
			HashMap<String, Object> meta = new HashMap<String, Object>();
			Product product = (Product) homeProducts.get(i);
			meta.put("id", product.getId());
			meta.put("name", product.getName());
			meta.put("icon", product.getIcon());
			meta.put("status", product.getStatus().getName());
			meta.put("price", product.getPrice().getPrice());
			meta.put("description", product.getDescription());
			mapList.add(meta);
		}

		view.addObject("productMapList", mapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/admin")
	public ModelAndView admin() {
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "admin");
		return new ModelAndView("admin", "message", meta);
	}

	private String getItemCookies(Cookie[] list, String key) {
		if (list != null) {
			for (int i = 0; i < list.length; i++) {
				if (list[i].getName().equals(key))
					return list[i].getValue();
			}
		}

		return null;
	}

}
