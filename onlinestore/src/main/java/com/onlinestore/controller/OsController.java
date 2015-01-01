package com.onlinestore.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.onlinestore.service.CartProductService;
import com.onlinestore.service.CartService;
import com.onlinestore.service.CategoryService;
import com.onlinestore.service.ConfigService;
import com.onlinestore.service.OsOrderDetailService;
import com.onlinestore.service.OsOrderService;
import com.onlinestore.service.OsUserService;
import com.onlinestore.service.ProductService;
import com.onlinestore.service.PromotionService;

public abstract class OsController {
	protected PromotionService getPromotionService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		PromotionService promotionService = (PromotionService) appCtx
				.getBean("promotionService");
		return promotionService;
	}
	
	protected ConfigService getConfigService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ConfigService configService = (ConfigService) appCtx
				.getBean("configService");
		return configService;
	}

	protected OsUserService getUserService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsUserService userService = (OsUserService) appCtx
				.getBean("osUserService");
		return userService;
	}
	
	protected OsOrderService getOsOrderService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsOrderService osOrderService = (OsOrderService) appCtx
				.getBean("osOrderService");
		return osOrderService;
	}
	
	protected OsOrderDetailService getOsOrderDetailService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		OsOrderDetailService osOrderDetailService = (OsOrderDetailService) appCtx
				.getBean("osOrderDetailService");
		return osOrderDetailService;
	}
	
	protected CartService getCartService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CartService cartService = (CartService) appCtx.getBean("cartService");
		return cartService;
	}
	
	protected ProductService getProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProductService productService = (ProductService) appCtx
				.getBean("productService");
		return productService;
	}
	
	protected CartProductService getCartProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CartProductService cartProductService = (CartProductService) appCtx
				.getBean("cartProductService");
		return cartProductService;
	}
	
	protected CategoryService getCategoryService()
	{
		ApplicationContext appCtx = 
	    		new ClassPathXmlApplicationContext("beans-service.xml");
		CategoryService categoryService = 
	    		(CategoryService)appCtx.getBean("categoryService");
	    return categoryService;
	}

}
