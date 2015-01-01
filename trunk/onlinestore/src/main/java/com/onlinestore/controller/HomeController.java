package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.Category;
import com.onlinestore.model.Product;
import com.onlinestore.util.Variable;

@Controller
public class HomeController extends OsController {

	@RequestMapping(value = "/homes")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		String ck_userId = null;
		ck_user = getItemCookies(cookie, "os_username");
		ck_userId = getItemCookies(cookie, "os_userid");
		if (ck_user != null) {
			if (ck_user.equals("admin"))
				viewName = "admin";
			HttpSession session = request.getSession();
			synchronized (session) {
				session.setAttribute("os_username", ck_user);
				session.setAttribute("os_userid", ck_userId);
			}
		}
		// Select 'hot' and 'new' product to display in home page
		List<Product> homeProducts = getProductService().getHomeProducts();
		// List<Product> homeProducts = getProductService().getProducts();
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();

		request.setAttribute("message", "message");
		for (int i = 0; i < homeProducts.size(); i++) {
			HashMap<String, Object> meta = new HashMap<String, Object>();
			Product product = (Product) homeProducts.get(i);
			meta.put("id", product.getId());
			meta.put("name", product.getName());
			meta.put("icon", product.getIcon());
			meta.put("status", product.getStatus().getName());
			double price = product.getPrice().getPrice();
			meta.put("price", String.format(Variable.CURRENCY_FORMAT, price));
			meta.put("description", product.getDescription());
			mapList.add(meta);
		}
		view.addObject("productMapList", mapList);
		// Set categories for searching product
		List<Category> categories = getCategoryService().getSubCategory(0);
		List<HashMap<String, Object>> categoryMapList = new ArrayList<HashMap<String, Object>>();
		// Add first category: Tat ca danh muc
		HashMap<String, Object> firstCategoryMap = new HashMap<String, Object>();
		firstCategoryMap.put("categoryId", 0);
		firstCategoryMap.put("categoryName", "Tất cả danh mục");
		categoryMapList.add(firstCategoryMap);
		// Add category list
		int categorySize = categories.size();
		for (int i = 0; i < categorySize; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categories.get(i).getId());
			map.put("categoryName", categories.get(i).getName());
			categoryMapList.add(map);
		}
		view.addObject("categoryMapList", categoryMapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/searchProduct")
	public ModelAndView searchProduct(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		List<Product> resultProductList = new ArrayList<Product>();
		List<HashMap<String, Object>> productMapList = new ArrayList<HashMap<String, Object>>();
		Integer categoryId = Integer.valueOf(request
				.getParameter(Variable.REQUEST_CATEGORY_ID));
		String keyword = request.getParameter(Variable.REQUEST_KEYWORD);
		if (keyword.equals("")) {
			// Get all product
			resultProductList = getProductService().getProducts();
		} else {
			if (categoryId == 0) {
				// Get product following keyword
				resultProductList = getProductService().search(keyword);
			} else {
				// Get product following keyword and category
				resultProductList = getProductService().searchByCategory(
						keyword, categoryId);
			}
		}
		for (int i = 0; i < resultProductList.size(); i++) {
			HashMap<String, Object> meta = new HashMap<String, Object>();
			Product product = (Product) resultProductList.get(i);
			meta.put("id", product.getId());
			meta.put("name", product.getName());
			meta.put("icon", product.getIcon());
			meta.put("status", product.getStatus().getName());
			double price = product.getPrice().getPrice();
			meta.put("price", String.format(Variable.CURRENCY_FORMAT, price));
			meta.put("description", product.getDescription());
			productMapList.add(meta);
		}
		view.addObject("productMapList", productMapList);

		// Set categories for searching product
		List<Category> categories = getCategoryService().getSubCategory(0);
		List<HashMap<String, Object>> categoryMapList = new ArrayList<HashMap<String, Object>>();
		// Add first category: Tat ca danh muc
		HashMap<String, Object> firstCategoryMap = new HashMap<String, Object>();
		firstCategoryMap.put("categoryId", 0);
		firstCategoryMap.put("categoryName", "Tất cả danh mục");
		categoryMapList.add(firstCategoryMap);
		// Add category list
		int categorySize = categories.size();
		for (int i = 0; i < categorySize; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categories.get(i).getId());
			map.put("categoryName", categories.get(i).getName());
			categoryMapList.add(map);
		}
		view.addObject("categoryMapList", categoryMapList);
		
		view.addObject("keyword", keyword);
		view.addObject("categorySelected", categoryId);

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
