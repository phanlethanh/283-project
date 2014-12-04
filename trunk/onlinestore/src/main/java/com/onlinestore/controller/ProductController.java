package com.onlinestore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinestore.model.Image;
import com.onlinestore.model.Product;
import com.onlinestore.service.ProductService;

@Controller
public class ProductController {
	private ProductService getProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProductService productService = (ProductService) appCtx
				.getBean("productService");
		return productService;
	}

	@RequestMapping(value = "/productDetail")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "product";
		Product product = null;
		Integer id = Integer.valueOf(request.getParameter("product_id"));
		product = getProductService().getProduct(id);
		HashMap<String, Object> productMap = new HashMap<String, Object>();
		productMap.put("id", product.getId());
		productMap.put("name", product.getName());
		productMap.put("icon", product.getIcon());
		productMap.put("status", product.getStatus().getName());
		productMap.put("price", product.getPrice().getPrice());
		productMap.put("description", product.getDescription());
		productMap.put("producer", product.getProducer().getName());
		productMap.put("producerDescription", product.getProducer()
				.getDescription());
		productMap.put("promotion", product.getPromotion().getName());
		// Images of gallery
		List<HashMap<String, Object>> imageMapList = new ArrayList<HashMap<String, Object>>();
		List<Image> images = new ArrayList<Image>(product.getGallery()
				.getImages());
		for (int i = 0; i < images.size(); i++) {
			HashMap<String, Object> imageMap = new HashMap<String, Object>();
			imageMap.put("imageName", images.get(i).getName());
			imageMap.put("imageDescription", images.get(i).getDescription());
			imageMapList.add(imageMap);
		}
		productMap.put("images", imageMapList);
		view.addObject("product", productMap);
		view.setViewName(viewName);
		return view;
	}
}
