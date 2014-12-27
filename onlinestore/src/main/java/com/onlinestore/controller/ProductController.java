package com.onlinestore.controller;

import java.awt.image.BufferedImage;
import java.beans.XMLEncoder;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



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
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Image;
import com.onlinestore.model.Product;
import com.onlinestore.service.CategoryService;
import com.onlinestore.service.FieldsProductService;
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
	
	@RequestMapping (value="/adminDetailProduct", method=RequestMethod.POST)
	public void adminDetailProduct(HttpServletRequest request, HttpServletResponse response)
	{
		String idProduct= request.getParameter("id");
		Product product = null;
		product = getProductService().getProduct(Integer.parseInt(idProduct));
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
			imageMap.put("id", images.get(i).getId());
			imageMap.put("imageDescription", images.get(i).getDescription());
			imageMapList.add(imageMap);
		}
		productMap.put("images", imageMapList);
		
		request.setAttribute("product", product);
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
	
	@RequestMapping (value="/uploadImage", method=RequestMethod.POST)
	public void upload(@RequestParam("myimage") MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
	     //rest of the code goes here...
			String name = file.getOriginalFilename();
			System.out.print(name);
			HashMap<String, Object> map = new HashMap<String,Object>();
		    try {
		    BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
		    File destination = new File("C:/Users/11123_000/workspace/283-project/onlinestore/src/main/webapp/image/"+name);
		    
		    String link_store = "image/"+name;
		    ImageIO.write(src, "png", destination);
		    map.put("code", 1);
		    map.put("link", link_store);
		    } catch(Exception e) {
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
	@RequestMapping (value="/addImageToGallery", method=RequestMethod.POST)
	public void addImageGallery(@RequestParam("myimage") MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
	     //rest of the code goes here...
			String name = file.getOriginalFilename();
			HashMap<String, Object> map = new HashMap<String,Object>();
		    try {
		    BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
		    String fileSeparator = System.getProperty("file.separator");
		   
		    File destination = new File("C:/Users/11123_000/workspace/283-project/onlinestore/src/main/webapp/image/"+name);
		    destination.createNewFile();
		    System.out.print(destination.getAbsoluteFile().getParent());
		    String link_store = "image/product_image/"+name;
		    if(ImageIO.write(src, "png", destination))
		    {
		    	map.put("code", 1);
			    map.put("link", link_store);
		    }
		    
		    } catch(Exception e) {
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
	
	@RequestMapping(value="/deleteProduct", method=RequestMethod.POST)
	public void deleteProduct(HttpServletRequest request, HttpServletResponse response)
	{
		String productId = request.getParameter("id");
		getProductService().deleteProduct(Integer.parseInt(productId));
		HashMap<String, Object> meta = new HashMap<String,Object>();
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
	@RequestMapping(value="/configFieldOfProduct")
	public void configFieldOfProduct(HttpServletRequest request, HttpServletResponse response)
	{
		
		HashMap<String,Object> fieldsMap = new HashMap<String,Object>();

		HashMap<String,Object> fieldsMapDiff = new HashMap<String, Object>();
		//System.out.print(productMap1);
		HashMap<String,Object> default_fields = new HashMap<String,Object>();
		HashMap<String, Object> diff_fields_name = new HashMap<String,Object>();
		HashMap<String, Object> fields_info = new HashMap<String,Object>();
		//byte[] data = SerializationUtils.serializide(product);
		String id_category = request.getParameter("id_category");
		FieldsProduct fields = getCategoryService().getFieldsOfCategory(Integer.parseInt(id_category));
		
		List<String> field_names = Arrays.asList("memory","camera","kich thuot","do day","media");
		if(fields != null)
			fields_info.put("fields_id", fields.getId());
		for(int i = 0; i < field_names.size(); i++)
		{
			HashMap<String, Object> item_field_value = new HashMap<String,Object>();
			item_field_value.put("group_name", "General");
			item_field_value.put("field_name", "");
			HashMap<String, Object> item_field = new HashMap<String,Object>();
			default_fields.put(field_names.get(i), item_field_value);
			//default_fields.add(item_field);
		}
		
		if(fields != null)
		{
			if(fields.getSerialFields() != null)
			{
				byte[] data_fields = Base64.decode(fields.getSerialFields());
				fieldsMap = ( HashMap<String,Object>) SerializationUtils.deserialize(data_fields);
				//System.out.print(fieldsMap);
			}
		}
		else
		{
			FieldsProduct fieldSave = new FieldsProduct();
			byte[] data = SerializationUtils.serialize(default_fields);
			String data1 = Base64.encodeBytes(data);
			fieldSave.setSerialFields(data1);
			getFieldsProductService().CreateFieldProduct(fieldSave);
			
			
			fields = getFieldsProductService().getField(getFieldsProductService().getLastInsertId());
			fields_info.put("fields_id", getFieldsProductService().getLastInsertId());
			Category category =getCategoryService().getCategory(Integer.parseInt(id_category));
			category.setFieldsProduct(fields);
			getCategoryService().updateCategory(category);
		}
		if(!fieldsMap.isEmpty())
		{
			
			//fieldsMap.addAll(default_fields);
			System.out.print(fieldsMap);
			//fieldsMap.putAll(default_fields);
			fieldsMapDiff = arrayDiffKeys(fieldsMap,default_fields);
			int i =0;
			for (Entry<String, Object> entry : fieldsMapDiff.entrySet())
			{
	            String key=entry.getKey();
	            diff_fields_name.put(""+i,key);
	            i++;
	        }
			//diff_fields_name.put("0", "abc");
			diff_fields_name.put("count", i);
		}
		else
			fieldsMap = default_fields;
		/*for (Entry<String, Object> entry : fieldsMap.entrySet()){
            String key=entry.getKey();
            String value=(String) entry.getValue();
        }*/
		List<HashMap> data = new ArrayList<HashMap>();
		//list cac field mac dinh
		data.add(fieldsMap);
		//list cac field them vao
		data.add(fieldsMapDiff);
		//list ten cac field them vao
		data.add(diff_fields_name);
		//info fields
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
		/*ModelAndView view = new ModelAndView();
		view.addObject("fieldsMap", fieldsMap);
		view.addObject("fieldsMapDiff", fieldsMapDiff);
		view.setViewName("configFieldsProduct");
		return view;*/
	}
	
	public HashMap arrayDiffKeys(HashMap<String,Object> list1,HashMap<String, Object> list2)
	{
		HashMap<String,Object> result = new HashMap<String,Object>();
		for (Entry<String, Object> entry : list1.entrySet())
		{
            String key=entry.getKey();
            if(!list2.containsKey(key))
            	result.put(key, entry.getValue());   
        }
		return  result;
	}
	
	
}
