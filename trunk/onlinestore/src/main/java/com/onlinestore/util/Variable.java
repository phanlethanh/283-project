package com.onlinestore.util;

public class Variable {
	// Session attributes
	public static final String SESSION_USERNAME = "os_username";
	public static final String SESSION_PASSWORD = "password";
	public static final String SESSION_USER_ID = "os_userid";
	public static final String SESSION_CART_PRODUCT_MAP_LIST = "cartProductMapListSession";
	public static final String SESSION_CART_NUMBER = "cartNumber";
	public static final String SESSION_CART_PRICE = "cartPrice";
	public static final String SESSION_CATEGORY = "categoryMapList";
	public static final String SESSION_CATEGORY_SELECTED = "categorySelected";
	
	// Request parameters
	public static final String REQUEST_ORDER_ID = "order_id";
	public static final String REQUEST_KEYWORD = "keyword";
	public static final String REQUEST_CATEGORY_ID = "category_id";
	
	public static final Integer pageSize = 9;
	public static final Integer homePageSize = 8;

	// Product detail host
	public static final String PRODUCT_DETAIL_HOST = "http://localhost:8080/onlinestore/productDetail.html?product_id=";
	
	// Format
	public static final String CURRENCY_FORMAT = "%1$,.0f";
	
	// Constant ID in database
	public static final Integer ID_NEW_ORDER_STATUS = 6;
	public static final Integer ID_ZERO_TRANSPORT_FEE = 1;
	public static final Integer ID_VAT_TAX = 1;
	public static final Integer ID_MIN_PAYMENT = 1;
	public static final Integer ID_MAX_PAYMENT = 2;
	public static final Integer ID_NEW_PRODUCT_STATUS = 1;
	public static final Integer ID_HOT_PRODUCT_STATUS = 2;
	public static final Integer ID_WAITING_PRODUCT_STATUS = 3;
	public static final Integer ID_INSTOCK_PRODUCT_STATUS = 4;
	public static final Integer ID_OUTOFSTOCK_PRODUCT_STATUS = 5;
	public static final Integer USD_VND = 21387;
}