package com.onlinestore.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.postgresql.util.Base64;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.SerializationUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.onlinestore.model.Category;
import com.onlinestore.model.CategoryProduct;
import com.onlinestore.model.DatasFieldsProduct;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Gallery;
import com.onlinestore.model.Image;
import com.onlinestore.model.Price;
import com.onlinestore.model.Producer;
import com.onlinestore.model.Product;
import com.onlinestore.model.Promotion;
import com.onlinestore.model.Status;
import com.onlinestore.service.CategoryProductService;
import com.onlinestore.service.CategoryService;
import com.onlinestore.service.DatasFieldsProductService;
import com.onlinestore.service.FieldsProductService;
import com.onlinestore.service.GalleryService;
import com.onlinestore.service.ImageService;
import com.onlinestore.service.PriceService;
import com.onlinestore.service.ProducerService;
import com.onlinestore.service.ProductService;
import com.onlinestore.service.PromotionService;
import com.onlinestore.service.StatusService;
import com.onlinestore.util.Variable;

@Controller
public class ProductController {
	private ProductService getProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProductService productService = (ProductService) appCtx
				.getBean("productService");
		return productService;
	}

	private CategoryService getCategoryService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CategoryService categoryService = (CategoryService) appCtx
				.getBean("categoryService");
		return categoryService;
	}

	private FieldsProductService getFieldsProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		FieldsProductService fieldsProductService = (FieldsProductService) appCtx
				.getBean("fieldsProductService");
		return fieldsProductService;
	}

	private DatasFieldsProductService getDatasFieldsProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		DatasFieldsProductService datasFieldsProductService = (DatasFieldsProductService) appCtx
				.getBean("datasFieldsProductService");
		return datasFieldsProductService;
	}

	private ImageService getImageService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ImageService imageService = (ImageService) appCtx
				.getBean("imageService");
		return imageService;
	}

	private PromotionService getPromotionService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		PromotionService promotionService = (PromotionService) appCtx
				.getBean("promotionService");
		return promotionService;
	}

	private PriceService getPriceService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		PriceService priceService = (PriceService) appCtx
				.getBean("priceService");
		return priceService;
	}

	private StatusService getStatusService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		StatusService statusService = (StatusService) appCtx
				.getBean("statusService");
		return statusService;
	}

	private GalleryService getGalleryService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		GalleryService galleryService = (GalleryService) appCtx
				.getBean("galleryService");
		return galleryService;
	}

	private ProducerService getProducerService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		ProducerService producerService = (ProducerService) appCtx
				.getBean("producerService");
		return producerService;
	}

	private CategoryProductService getCategoryProductService() {
		ApplicationContext appCtx = new ClassPathXmlApplicationContext(
				"beans-service.xml");
		CategoryProductService categoryProductService = (CategoryProductService) appCtx
				.getBean("categoryProductService");
		return categoryProductService;
	}

	@RequestMapping(value = "/productDetail")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "product";
		Product product = null;
		Integer id = null;
		try {
			id = Integer.valueOf(request.getParameter("product_id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		product = getProductService().getProduct(id);
		HashMap<String, Object> productMap = new HashMap<String, Object>();
		productMap.put("id", product.getId());
		productMap.put("name", product.getName());
		productMap.put("icon", product.getIcon());
		productMap.put("status", product.getStatus().getName());
		double price = product.getPrice().getPrice();
		productMap.put("price", String.format(Variable.CURRENCY_FORMAT, price));
		productMap.put("description", product.getDescription());
		productMap.put("producer", product.getProducer().getName());
		productMap.put("producerDescription", product.getProducer()
				.getDescription());
		if (null == product.getPromotion()) {
			productMap.put("promotion", "Không");
		} else {
			productMap.put("promotion", product.getPromotion().getName());
		}
		if (product.getDatasFieldsProduct() != null)
		{
			productMap.put("datasFields", product.getDatasFieldsProduct());
			
		}
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
		HashMap<String, Object> fieldsData = new HashMap<String,Object>();
		List<String> list_field_name = new ArrayList<String>();
		List<String> list_field_data = new ArrayList<String>();
		if (product.getDatasFieldsProduct() != null)
		{
			DatasFieldsProduct datasFields = product.getDatasFieldsProduct();
			byte[] data_fields = Base64.decode(datasFields.getSerialData());
			fieldsData = (HashMap<String, Object>) SerializationUtils.deserialize(data_fields);
			
			for (Entry<String, Object> entry : fieldsData.entrySet()) {
				list_field_name.add(entry.getKey());
				list_field_data.add(entry.getValue().toString());
			}
		}
		productMap.put("images", imageMapList);
		productMap.put("fieldsData", fieldsData);
		view.addObject("product", productMap);
		view.addObject("fieldsName",list_field_name);
		view.setViewName(viewName);
		return view;
	}

	@RequestMapping(value = "/adminDetailProduct", method = RequestMethod.POST)
	public void adminDetailProduct(HttpServletRequest request,
			HttpServletResponse response) {
		String idProduct = request.getParameter("id");
		Product product = null;
		product = getProductService().getProduct(Integer.parseInt(idProduct));
		HashMap<String, Object> productMap = new HashMap<String, Object>();
		productMap.put("id", product.getId());
		productMap.put("name", product.getName());
		productMap.put("icon", product.getIcon());
		productMap.put("name_status", product.getStatus().getName());
		double price = product.getPrice().getPrice();
		productMap.put("price", product.getPrice().getPrice());
		productMap.put("description", product.getDescription());
		productMap.put("producer", product.getProducer().getName());
		productMap.put("producerDescription", product.getProducer()
				.getDescription());
		productMap.put("name_promotion", product.getPromotion().getName());
		productMap.put("stock", product.getStockQuantity());
		// Images of gallery
		List<HashMap<String, Object>> imageMapList = new ArrayList<HashMap<String, Object>>();
		List<Image> images = new ArrayList<Image>(product.getGallery()
				.getImages());
		for (int i = 0; i < images.size(); i++) {
			HashMap<String, Object> imageMap = new HashMap<String, Object>();
			imageMap.put("imageName", images.get(i).getName());
			imageMap.put("id", images.get(i).getId());
			imageMap.put("imageDescription", images.get(i).getDescription());
			imageMapList.add(imageMap);
		}
		productMap.put("images", imageMapList);

		List<Promotion> promotion = new ArrayList<Promotion>();
		List<HashMap<String, Object>> promotionMapList = new ArrayList<HashMap<String, Object>>();
		promotion = getPromotionService().getPromotions();
		for (int i = 0; i < promotion.size(); i++) {
			HashMap<String, Object> promotionMap = new HashMap<String, Object>();
			promotionMap.put("name", promotion.get(i).getName());
			promotionMap.put("id", promotion.get(i).getId());
			promotionMapList.add(promotionMap);
		}
		productMap.put("promotion", promotionMapList);

		List<Status> status = new ArrayList<Status>();
		List<HashMap<String, Object>> statusMapList = new ArrayList<HashMap<String, Object>>();
		// status = getStatusService().getStatuses();
		status = getStatusService().getProductStatuses();
		for (int i = 0; i < status.size(); i++) {
			HashMap<String, Object> statusMap = new HashMap<String, Object>();
			statusMap.put("name", status.get(i).getName());
			statusMap.put("id", status.get(i).getId());
			statusMapList.add(statusMap);
		}
		productMap.put("status", statusMapList);
		
		String json = new Gson().toJson(productMap);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public void upload(@RequestParam("myimage") MultipartFile file,
			HttpServletResponse response, HttpServletRequest request) {
		// rest of the code goes here...
		String name = file.getOriginalFilename();
		System.out.print(name);
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file
					.getBytes()));
			String filePath = request.getServletContext().getRealPath(
					"/image/product_icon/" + name);
			File destination = new File(filePath);

			String link_store = "image/product_icon/" + name;
			if (ImageIO.write(src, "png", destination)) {

				map.put("code", 1);
				map.put("link", link_store);
			}

		} catch (Exception e) {
			map.put("code", 0);
			e.printStackTrace();
		}

		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addImageToGallery", method = RequestMethod.POST)
	public void addImageGallery(@RequestParam("myimage") MultipartFile file,
			HttpServletResponse response, HttpServletRequest request) {
		// rest of the code goes here...
		String name = file.getOriginalFilename();
		String description = request.getParameter("image_description");
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file
					.getBytes()));
			String fileSeparator = System.getProperty("file.separator");
			String filePath = request.getServletContext().getRealPath(
					"/image/product_image/" + name);
			File destination = new File(filePath);
			destination.createNewFile();

			String link_store = "image/product_image/" + name;
			if (ImageIO.write(src, "png", destination)) {
				map.put("code", 1);
				map.put("link", link_store);
				Image image = new Image();
				image.setName(link_store);
				image.setDescription(description);
				getImageService().createImage(image);
				int id = getImageService().getLastInsertId();
				map.put("id_image", id);
			}

		} catch (Exception e) {
			map.put("code", 0);
			e.printStackTrace();
		}

		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public void deleteProduct(HttpServletRequest request,
			HttpServletResponse response) {
		String productId = request.getParameter("id");
		getProductService().deleteProduct(Integer.parseInt(productId));
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("code", 1);
		String json = new Gson().toJson(meta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "unchecked" })
	@RequestMapping(value = "/configFieldOfProduct")
	public void configFieldOfProduct(HttpServletRequest request,
			HttpServletResponse response) {

		HashMap<String, Object> fieldsMap = new HashMap<String, Object>();

		HashMap<String, Object> fieldsMapDiff = new HashMap<String, Object>();
		// System.out.print(productMap1);
		HashMap<String, Object> default_fields = new HashMap<String, Object>();
		HashMap<String, Object> diff_fields_name = new HashMap<String, Object>();
		HashMap<String, Object> fields_info = new HashMap<String, Object>();
		// byte[] data = SerializationUtils.serializide(product);
		String id_category = request.getParameter("id_category");
		FieldsProduct fields = getCategoryService().getFieldsOfCategory(
				Integer.parseInt(id_category));

		List<String> field_names = Arrays.asList("memory", "camera",
				"kich thuot", "do day", "media");
		if (fields != null)
			fields_info.put("fields_id", fields.getId());
		for (int i = 0; i < field_names.size(); i++) {
			HashMap<String, Object> item_field_value = new HashMap<String, Object>();
			item_field_value.put("group_name", "General");
			item_field_value.put("field_name", "");
			HashMap<String, Object> item_field = new HashMap<String, Object>();
			default_fields.put(field_names.get(i), item_field_value);
			// default_fields.add(item_field);
		}

		if (fields != null) {
			if (fields.getSerialFields() != null) {
				byte[] data_fields = Base64.decode(fields.getSerialFields());
				fieldsMap = (HashMap<String, Object>) SerializationUtils
						.deserialize(data_fields);
				// System.out.print(fieldsMap);
			}
		} else {
			FieldsProduct fieldSave = new FieldsProduct();
			byte[] data = SerializationUtils.serialize(default_fields);
			String data1 = Base64.encodeBytes(data);
			fieldSave.setSerialFields(data1);
			getFieldsProductService().CreateFieldProduct(fieldSave);

			fields = getFieldsProductService().getField(
					getFieldsProductService().getLastInsertId());
			fields_info.put("fields_id", getFieldsProductService()
					.getLastInsertId());
			Category category = getCategoryService().getCategory(
					Integer.parseInt(id_category));
			category.setFieldsProduct(fields);
			getCategoryService().updateCategory(category);
		}
		if (!fieldsMap.isEmpty()) {

			// fieldsMap.addAll(default_fields);
			System.out.print(fieldsMap);
			// fieldsMap.putAll(default_fields);
			fieldsMapDiff = arrayDiffKeys(fieldsMap, default_fields);
			int i = 0;
			for (Entry<String, Object> entry : fieldsMapDiff.entrySet()) {
				String key = entry.getKey();
				diff_fields_name.put("" + i, key);
				i++;
			}
			// diff_fields_name.put("0", "abc");
			diff_fields_name.put("count", i);
		} else
			fieldsMap = default_fields;
		/*
		 * for (Entry<String, Object> entry : fieldsMap.entrySet()){ String
		 * key=entry.getKey(); String value=(String) entry.getValue(); }
		 */
		List<HashMap> data = new ArrayList<HashMap>();
		// list cac field mac dinh
		data.add(fieldsMap);
		// list cac field them vao
		data.add(fieldsMapDiff);
		// list ten cac field them vao
		data.add(diff_fields_name);
		// info fields
		data.add(fields_info);
		String json = new Gson().toJson(data);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * ModelAndView view = new ModelAndView(); view.addObject("fieldsMap",
		 * fieldsMap); view.addObject("fieldsMapDiff", fieldsMapDiff);
		 * view.setViewName("configFieldsProduct"); return view;
		 */
	}

	public HashMap arrayDiffKeys(HashMap<String, Object> list1,
			HashMap<String, Object> list2) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		for (Entry<String, Object> entry : list1.entrySet()) {
			String key = entry.getKey();
			if (!list2.containsKey(key))
				result.put(key, entry.getValue());
		}
		return result;
	}

	@RequestMapping(value = "/loadFieldsOfProduct", method = RequestMethod.POST)
	public void loadFieldsOfProduct(HttpServletRequest request,
			HttpServletResponse response) {
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		int category_root = findRootOfCategory(category_id);
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		Product product = getProductService().getProduct(product_id);
		DatasFieldsProduct datasFields = product.getDatasFieldsProduct();

		// if(getDatasFieldsProductService().getDatasFieldsProduct(product_id)
		// != null)

		HashMap<String, Object> fieldsMap = new HashMap<String, Object>();
		HashMap<String, Object> fieldsName = new HashMap<String, Object>();
		HashMap<String, Object> fieldsData = new HashMap<String, Object>();
		List<HashMap> data = new ArrayList<HashMap>();

		FieldsProduct fields = getCategoryService().getFieldsOfCategory(
				category_root);
		byte[] data_fields1 = Base64.decode(fields.getSerialFields());
		fieldsMap = (HashMap<String, Object>) SerializationUtils
				.deserialize(data_fields1);
		int i = 0;
		for (Entry<String, Object> entry : fieldsMap.entrySet()) {
			fieldsData.put(entry.getKey(), "");
			String key = entry.getKey();
			fieldsName.put("" + i, key);
			i++;
		}
		fieldsName.put("count", i);

		if (datasFields != null) {
			byte[] data_fields = Base64.decode(datasFields.getSerialData());
			fieldsData = (HashMap<String, Object>) SerializationUtils
					.deserialize(data_fields);
			int size = fieldsData.size();
			fieldsData.put("count", size);
		} else {

			DatasFieldsProduct newDataFields = new DatasFieldsProduct();
			byte[] data_encode = SerializationUtils.serialize(fieldsData);
			String data1 = Base64.encodeBytes(data_encode);
			newDataFields.setSerialData(data1);
			// newDataFields.setId(1);
			// System.out.print(newDataFields);
			if (newDataFields != null)
				getDatasFieldsProductService().createDatasFieldsProduct(
						newDataFields);
			product.setDatasFieldsProduct(newDataFields);
			getProductService().updateProduct(product);
		}

		data.add(fieldsData);
		data.add(fieldsName);
		String json = new Gson().toJson(data);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/saveEditConfigProduct", method = RequestMethod.POST)
	public void saveEditConfigProduct(HttpServletRequest request,
			HttpServletResponse response) {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		Product product = getProductService().getProduct(product_id);
		DatasFieldsProduct fields = product.getDatasFieldsProduct();
		HashMap<String, Object> datasFields = new HashMap<String, Object>();
		byte[] data_fields = Base64.decode(fields.getSerialData());
		datasFields = (HashMap<String, Object>) SerializationUtils
				.deserialize(data_fields);
		for (Entry<String, Object> entry : datasFields.entrySet()) {
			if (request.getParameter(entry.getKey()) != null)
				entry.setValue(request.getParameter(entry.getKey()));
		}
		System.out.print("cccccccccc " + datasFields);
		byte[] data_encode = SerializationUtils.serialize(datasFields);
		String data1 = Base64.encodeBytes(data_encode);
		fields.setSerialData(data1);
		getDatasFieldsProductService().update(fields);
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("code", 1);
		String json = new Gson().toJson(meta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int findRootOfCategory(int category_id) {
		Category category = getCategoryService().getCategory(category_id);
		while (category.getParentId() != 0) {
			category = getCategoryService().getCategory(category.getParentId());
		}
		return category.getId();
	}

	@RequestMapping(value = "/saveEditProduct", method = RequestMethod.POST)
	public void saveEditProduct(HttpServletRequest request,
			HttpServletResponse response) {
		// getProductService().updateProduct(product);
		int id_product = Integer.parseInt(request.getParameter("id_product"));
		Product product = getProductService().getProduct(id_product);
		Price price = product.getPrice();
		price.setPrice(Double.parseDouble(request.getParameter("price")));
		getPriceService().updatePrice(price);
		product.setDescription(request.getParameter("description"));
		product.setStockQuantity(Integer.parseInt(request.getParameter("stock")));
		if (request.getParameter("icon") != "")
			product.setIcon(request.getParameter("icon"));
		// product.getPromotion().set;
		int id_promotion = Integer.parseInt(request
				.getParameter("id_promotion"));
		product.setPromotion(getPromotionService().getPromotion(id_promotion));
		int id_status = Integer.parseInt(request.getParameter("id_status"));
		product.setStatus(getStatusService().getStatus(id_status));
		String[] arr_list_add = null;
		if (request.getParameter("list_image_add") != "") {
			String list_image = request.getParameter("list_image_add");
			arr_list_add = list_image.split("\\|", -1);
		}
		Gallery gallery = product.getGallery();
		if(arr_list_add != null)
		{
			for (int i = 0; i < arr_list_add.length; i++) {
				if (arr_list_add[i] != "") {
					Image image = getImageService().getImage(
							Integer.parseInt(arr_list_add[i]));
					image.setGallery(gallery);
					if (image != null)
						getImageService().update(image);
				}

			}
		}
		
		String[] arr_list_delete = null;
		if (request.getParameter("list_image_delete") != "") {
			String list_image = request.getParameter("list_image_delete");
			arr_list_delete = list_image.split("\\|", -1);
		}
		if(arr_list_delete != null)
		{
			for (int i = 0; i < arr_list_delete.length; i++) {
				if (arr_list_delete[i] != "") {
					Image image = getImageService().getImage(
							Integer.parseInt(arr_list_delete[i]));
					if (image != null)
						getImageService().deleteImage(image);
				}

			}
		}
		
		getProductService().updateProduct(product);

		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("code", 1);
		String json = new Gson().toJson(meta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public void addProduct(HttpServletRequest request,
			HttpServletResponse response) {
		int id_category = Integer.parseInt(request.getParameter("id_category"));
		HashMap<String, Object> data = new HashMap<String, Object>();
		List<Category> list_sub_category = new ArrayList<Category>();
		List<HashMap<String, Object>> subCategoryMapList = new ArrayList<HashMap<String, Object>>();
		list_sub_category = getCategoryService().getSubCategory(id_category);
		if (list_sub_category.isEmpty()) {
			list_sub_category
					.add(getCategoryService().getCategory(id_category));
		}

		for (int i = 0; i < list_sub_category.size(); i++) {
			HashMap<String, Object> subCategoryMap = new HashMap<String, Object>();
			subCategoryMap.put("name", list_sub_category.get(i).getName());
			subCategoryMap.put("id", list_sub_category.get(i).getId());
			subCategoryMapList.add(subCategoryMap);
		}
		data.put("sub_category", subCategoryMapList);
		List<Promotion> promotion = new ArrayList<Promotion>();
		List<HashMap<String, Object>> promotionMapList = new ArrayList<HashMap<String, Object>>();
		promotion = getPromotionService().getPromotions();
		for (int i = 0; i < promotion.size(); i++) {
			HashMap<String, Object> promotionMap = new HashMap<String, Object>();
			promotionMap.put("name", promotion.get(i).getName());
			promotionMap.put("id", promotion.get(i).getId());
			promotionMapList.add(promotionMap);
		}
		data.put("promotion", promotionMapList);

		List<Status> status = new ArrayList<Status>();
		List<HashMap<String, Object>> statusMapList = new ArrayList<HashMap<String, Object>>();
		// status = getStatusService().getStatuses();
		status = getStatusService().getProductStatuses();
		for (int i = 0; i < status.size(); i++) {
			HashMap<String, Object> statusMap = new HashMap<String, Object>();
			statusMap.put("name", status.get(i).getName());
			statusMap.put("id", status.get(i).getId());
			statusMapList.add(statusMap);
		}
		data.put("status", statusMapList);
		String json = new Gson().toJson(data);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/saveAddProduct", method = RequestMethod.POST)
	public void adminAddProduct(HttpServletRequest request,
			HttpServletResponse response) {
		Product product = new Product();
		List<Category> list_parent_category = findListParentCategory(Integer
				.parseInt(request.getParameter("add_pr_id_category")));
		product.setDescription(request.getParameter("description"));
		product.setIcon(request.getParameter("icon"));
		product.setName(request.getParameter("name"));
		int id_promotion = Integer.parseInt(request
				.getParameter("id_promotion"));
		product.setPromotion(getPromotionService().getPromotion(id_promotion));
		int id_status = Integer.parseInt(request.getParameter("id_status"));
		product.setStatus(getStatusService().getStatus(id_status));
		String[] arr_list_add = null;
		if (request.getParameter("list_image_add") != null) {
			String list_image = request.getParameter("list_image_add");
			arr_list_add = list_image.split("\\|", -1);
		}
		Gallery gallery = new Gallery();
		gallery.setName(request.getParameter("name"));
		getGalleryService().createGallery(gallery);
		Gallery new_gallery_insert = getGalleryService().getLastInsertId();
		for (int i = 0; i < arr_list_add.length; i++) {
			if (arr_list_add[i] != "") {
				Image image = getImageService().getImage(
						Integer.parseInt(arr_list_add[i]));
				image.setGallery(new_gallery_insert);
				if (image != null)
					getImageService().update(image);
			}

		}
		product.setGallery(new_gallery_insert);
		Double fprice = Double.parseDouble(request.getParameter("price"));
		Price price = new Price();
		price.setPrice(fprice);
		getPriceService().createPrice(price);
		product.setPrice(price);
		Producer producer = getProducerService().getProducer(
				Integer.parseInt(request.getParameter("add_pr_id_category")));
		product.setProducer(producer);
		getProductService().createProduct(product);
		Product product_new = getProductService().getLastInsertId();
		Set set_category_product = new HashSet();
		for (int i = 0; i < list_parent_category.size(); i++) {
			CategoryProduct category_product_item = new CategoryProduct();
			category_product_item.setCategory(list_parent_category.get(i));
			category_product_item.setProduct(product_new);
			getCategoryProductService().createCategoryProduct(
					category_product_item);
			CategoryProduct new_insert = getCategoryProductService()
					.getLastInsertId();
			set_category_product.add(new_insert);
		}
		product_new.setCategoryProducts(set_category_product);
		getProductService().updateProduct(product_new);
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("code", 1);
		String json = new Gson().toJson(meta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Category> findListParentCategory(int category_id) {
		List<Category> list_parent = new ArrayList<Category>();
		Category category = getCategoryService().getCategory(category_id);
		while (category.getParentId() != 0) {
			list_parent.add(category);
			category = getCategoryService().getCategory(category.getParentId());
		}
		return list_parent;
	}

	@RequestMapping(value = "/importProductLoadCategory", method = RequestMethod.POST)
	public void importProductLoadCategory(HttpServletRequest request,
			HttpServletResponse response) {
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		HashMap<String, Object> data = new HashMap<String, Object>();
		List<Category> list_sub_category = new ArrayList<Category>();
		List<HashMap<String, Object>> subCategoryMapList = new ArrayList<HashMap<String, Object>>();
		list_sub_category = getCategoryService().getSubCategory(category_id);
		if (list_sub_category.isEmpty()) {
			list_sub_category
					.add(getCategoryService().getCategory(category_id));
		}

		for (int i = 0; i < list_sub_category.size(); i++) {
			HashMap<String, Object> subCategoryMap = new HashMap<String, Object>();
			subCategoryMap.put("name", list_sub_category.get(i).getName());
			subCategoryMap.put("id", list_sub_category.get(i).getId());
			subCategoryMapList.add(subCategoryMap);
		}
		data.put("sub_category", subCategoryMapList);
		String json = new Gson().toJson(data);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/importProduct", method = RequestMethod.POST)
	public void importProduct(@RequestParam("myFile") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String fileName = file.getName();
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		List<Category> list_parent_category = findListParentCategory(category_id);

		BufferedReader br = null;
		try {
			br = new BufferedReader(
					new InputStreamReader(file.getInputStream()));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		}
		String line;
		try {
			br.readLine();
			while ((line = br.readLine()) != null) {
				String[] fields = line.split(",");
				Product product = new Product();
				product.setName(fields[0]);
				double iPrice = Double.parseDouble(fields[2]);
				Price price = new Price();
				price.setPrice(iPrice);
				getPriceService().createPrice(price);
				Price newPriceInsert = getPriceService().getLastPriceInsert();
				product.setPrice(newPriceInsert);
				product.setDescription(fields[1]);
				int stockQuantity = Integer.parseInt(fields[3]);
				product.setStockQuantity(stockQuantity);
				Promotion promotion = getPromotionService().getPromotion(6);
				product.setPromotion(promotion);
				Status status = getStatusService().getStatus(1);
				product.setStatus(status);
				Producer producer = getProducerService().findProducerWithName(
						fields[4]);
				if (producer != null)
					product.setProducer(producer);
				if (fields.length >= 6 && fields[5] != "")
					product.setIcon(fields[5]);
				else
					product.setIcon("");
				Gallery gallery = new Gallery();
				gallery.setName(fields[0]);
				getGalleryService().createGallery(gallery);
				product.setGallery(getGalleryService().getLastInsertId());
				getProductService().createProduct(product);
				Product product_new = getProductService().getLastInsertId();
				Set set_category_product = new HashSet();
				for (int i = 0; i < list_parent_category.size(); i++) {
					CategoryProduct category_product_item = new CategoryProduct();
					category_product_item.setCategory(list_parent_category
							.get(i));
					category_product_item.setProduct(product_new);
					getCategoryProductService().createCategoryProduct(
							category_product_item);
					CategoryProduct new_insert = getCategoryProductService()
							.getLastInsertId();
					set_category_product.add(new_insert);
				}
				product_new.setCategoryProducts(set_category_product);
				getProductService().updateProduct(product_new);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		br.close();
		HashMap<String, Object> meta = new HashMap<String, Object>();
		String json = new Gson().toJson(meta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
}