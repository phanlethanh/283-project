package com.onlinestore.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
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

	private List<Category> categories = new ArrayList<Category>();
	private List<HashMap<String, Object>> categoryMapList = new ArrayList<HashMap<String, Object>>();

	@RequestMapping(value = "/homes")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		HttpSession session = request.getSession();
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		String ck_userId = null;
		ck_user = getItemCookies(cookie, "os_username");
		ck_userId = getItemCookies(cookie, "os_userid");
		if (ck_user != null) {
			if (ck_user.equals("admin"))
				viewName = "admin";
			synchronized (session) {
				session.setAttribute("os_username", ck_user);
				session.setAttribute("os_userid", ck_userId);
			}
		}
		// Select 'hot' and 'new' product to display in home page
		List<Product> homeProducts = getProductService().getHomeProducts();
		List<String> list_price = new ArrayList<String>();
		
		for(int i = 0; i < homeProducts.size(); i++)
		{
			if(homeProducts.get(i).getPromotion().getTypePromotion().equals("Sale off"))
			{
				Double price_self = homeProducts.get(i).getPrice().getPrice() - (homeProducts.get(i).getPrice().getPrice()/100)*homeProducts.get(i).getPromotion().getId()*10;
				list_price.add(String.format(Variable.CURRENCY_FORMAT, price_self));
			}
			else
				list_price.add("0");
		}
		List<HashMap<String, Object>> mapList = convertToHashMap(homeProducts);
		for(int i = 0; i < mapList.size(); i++)
		{
			mapList.get(i).put("price_seft",  list_price.get(i));
		}
		view.addObject("productMapList", mapList);
		// Get category list first
		this.categories = getCategoryService().getSubCategory(0);
		this.categoryMapList = getCategoryMapList(categories);
		session.setAttribute(Variable.SESSION_CATEGORY, categoryMapList);
		// Number product in cart
		Integer cartNumber = 0;
		Double cartPrice = 0.0;
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			if (null == session
					.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST)) {
				cartNumber = 0;
				cartPrice = 0.0;
			} else {
				Object obj = session
						.getAttribute(Variable.SESSION_CART_PRODUCT_MAP_LIST);
				List<HashMap<String, Object>> cpMapList = (List<HashMap<String, Object>>) obj;
				cartNumber = cpMapList.size();
				cartPrice = 0.0;
				int mapListSize = cpMapList.size();
				for (int i = 0; i < mapListSize; i++) {
					cartPrice += Double.valueOf(cpMapList.get(i).get("price")
							.toString().replace(",", ""));
				}
			}
		} else {
			// Login
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			cartNumber = getCartService().getProductCount(userId);
			cartPrice = getCartService().getProductPriceSum(userId);
		}
		session.setAttribute(Variable.SESSION_CART_NUMBER, cartNumber);
		session.setAttribute(Variable.SESSION_CART_PRICE,
				String.format(Variable.CURRENCY_FORMAT, cartPrice));
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
			if (categoryId == 0) {
				// Get product following keyword
				resultProductList = getProductService().getProducts();
			} else {
				resultProductList = getProductService().searchByCategory("",
						categoryId);
			}
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
		view.addObject("keyword", keyword);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/admin")
	public ModelAndView admin() {
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "admin");
		return new ModelAndView("admin", "message", meta);
	}

	@RequestMapping(value = "/newProducts")
	public ModelAndView getNewProducts(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		List<Product> newProducts = getProductService().getNewProducts();
		
		List<HashMap<String, Object>> mapList = convertToHashMap(newProducts);
		List<String> list_price = new ArrayList<String>();
		
		for(int i = 0; i < newProducts.size(); i++)
		{
			if(newProducts.get(i).getPromotion().getTypePromotion().equals("Sale off"))
			{
				Double price_self = newProducts.get(i).getPrice().getPrice() - (newProducts.get(i).getPrice().getPrice()/100)*newProducts.get(i).getPromotion().getId()*10;
				list_price.add(String.format(Variable.CURRENCY_FORMAT, price_self));
			}
			else
				list_price.add("0");
		}
		
		for(int i = 0; i < mapList.size(); i++)
		{
			mapList.get(i).put("price_seft",  list_price.get(i));
		}
		view.addObject("productMapList", mapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/hotProducts")
	public ModelAndView getHotProducts(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		List<Product> hotProducts = getProductService().getHotProducts();
		List<HashMap<String, Object>> mapList = convertToHashMap(hotProducts);
		List<String> list_price = new ArrayList<String>();
		
		for(int i = 0; i < hotProducts.size(); i++)
		{
			if(hotProducts.get(i).getPromotion().getTypePromotion().equals("Sale off"))
			{
				Double price_self = hotProducts.get(i).getPrice().getPrice() - (hotProducts.get(i).getPrice().getPrice()/100)*hotProducts.get(i).getPromotion().getId()*10;
				list_price.add(String.format(Variable.CURRENCY_FORMAT, price_self));
			}
			else
				list_price.add("0");
		}
		
		for(int i = 0; i < mapList.size(); i++)
		{
			mapList.get(i).put("price_seft",  list_price.get(i));
		}
		view.addObject("productMapList", mapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/waitingProducts")
	public ModelAndView getWaitingProducts(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		List<Product> waitingProducts = getProductService()
				.getWaitingProducts();
		List<HashMap<String, Object>> mapList = convertToHashMap(waitingProducts);
		List<String> list_price = new ArrayList<String>();
		
		for(int i = 0; i < waitingProducts.size(); i++)
		{
			if(waitingProducts.get(i).getPromotion().getTypePromotion().equals("Sale off"))
			{
				Double price_self = waitingProducts.get(i).getPrice().getPrice() - (waitingProducts.get(i).getPrice().getPrice()/100)*waitingProducts.get(i).getPromotion().getId()*10;
				list_price.add(String.format(Variable.CURRENCY_FORMAT, price_self));
			}
			else
				list_price.add("0");
		}
		
		for(int i = 0; i < mapList.size(); i++)
		{
			mapList.get(i).put("price_seft",  list_price.get(i));
		}
		view.addObject("productMapList", mapList);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/promotionProducts")
	public ModelAndView getPromotionProducts(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		List<Product> promotionProducts = getProductService()
				.getPromotionProducts();
		List<HashMap<String, Object>> mapList = convertToHashMap(promotionProducts);
		List<String> list_price = new ArrayList<String>();
		
		for(int i = 0; i < promotionProducts.size(); i++)
		{
			if(promotionProducts.get(i).getPromotion().getTypePromotion().equals("Sale off"))
			{
				Double price_self = promotionProducts.get(i).getPrice().getPrice() - (promotionProducts.get(i).getPrice().getPrice()/100)*promotionProducts.get(i).getPromotion().getId()*10;
				list_price.add(String.format(Variable.CURRENCY_FORMAT, price_self));
			}
			else
				list_price.add("0");
		}
		
		for(int i = 0; i < mapList.size(); i++)
		{
			mapList.get(i).put("price_seft",  list_price.get(i));
		}
		view.addObject("productMapList", mapList);
		view.setViewName(viewName);
		return view;
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

	// Convert List<Product> to List<HashMap>
	private List<HashMap<String, Object>> convertToHashMap(
			List<Product> productList) {
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		for (int i = 0; i < productList.size(); i++) {
			HashMap<String, Object> meta = new HashMap<String, Object>();
			Product product = (Product) productList.get(i);
			meta.put("id", product.getId());
			meta.put("name", product.getName());
			meta.put("icon", product.getIcon());
			meta.put("status", product.getStatus().getName());
			double price = product.getPrice().getPrice();
			meta.put("price", String.format(Variable.CURRENCY_FORMAT, price));
			meta.put("description", product.getDescription());
			mapList.add(meta);
		}
		return mapList;
	}

	// Get category list to show on search box of home page
	private List<HashMap<String, Object>> getCategoryMapList(
			List<Category> categoryList) {
		// Set categories for searching product
		List<HashMap<String, Object>> categoryMapList = new ArrayList<HashMap<String, Object>>();
		// Add first category: Tat ca danh muc
		HashMap<String, Object> firstCategoryMap = new HashMap<String, Object>();
		firstCategoryMap.put("categoryId", 0);
		firstCategoryMap.put("categoryName", "Tất cả danh mục");
		categoryMapList.add(firstCategoryMap);
		// Add category list
		int categorySize = categoryList.size();
		for (int i = 0; i < categorySize; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryList.get(i).getId());
			map.put("categoryName", categoryList.get(i).getName());
			categoryMapList.add(map);
		}
		return categoryMapList;
	}
}
