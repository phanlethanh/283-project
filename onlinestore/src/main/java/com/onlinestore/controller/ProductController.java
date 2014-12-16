package com.onlinestore.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
		    System.out.print(fileSeparator);
		    File destination = new File("C:/Users/11123_000/workspace/283-project/onlinestore/src/main/webapp/image/"+name);
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
}
