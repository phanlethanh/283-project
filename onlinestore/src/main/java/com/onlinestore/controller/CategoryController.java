package com.onlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.onlinestore.model.Category;
import com.onlinestore.model.OsUser;
import com.onlinestore.model.Product;
import com.onlinestore.service.CategoryService;
import com.onlinestore.service.impl.CategoryServiceImpl;
import com.onlinestore.service.impl.OsUserServiceImpl;

@Controller
public class CategoryController {
	
	private CategoryService getCategoryService()
	{
		ApplicationContext appCtx = 
	    		new ClassPathXmlApplicationContext("beans-service.xml");
		CategoryService categoryService = 
	    		(CategoryService)appCtx.getBean("categoryService");
	    return categoryService;
	}
	
	
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public void category(HttpServletRequest request,HttpServletResponse response )
	{
		
		String[] type = request.getParameterValues("type");
		String parent = request.getParameter("parent");
		String[] types = type[0].split(" ");
		if(parent.substring(0,1).equals("_"))
			parent = "0";
		System.out.print(parent);
		List<HashMap> list = new ArrayList<HashMap>();
		
		for(int i=0; i <types.length; i++)
		{
			if(types[i].equals("categorys") || types[i].equals("category"))
			{
				List<Category> list_category = new ArrayList<Category>();
				list_category = getCategoryService().getSubCategory(Integer.parseInt(parent));
				if(list_category != null)
				{
					for(int j = 0; j < list_category.size(); j++)
					{
						HashMap<String, Object> meta = new HashMap<String, Object>();
						meta.put("title", list_category.get(j).getName());
						meta.put("key", list_category.get(j).getId());
						meta.put("extraClasses", "category hasmenu ");
						meta.put("lazy", true);
						list.add(meta);
					}
				}
			}
		}
		String json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/addSubCategory", method=RequestMethod.POST)
	public void addSubCategory(HttpServletRequest request, HttpServletResponse response,@ModelAttribute Category category)
	{
		Category newCate = new Category();
		HashMap<String, Object> meta = new HashMap<String, Object>();
		if(getCategoryService().findCategoryWithName(category.getName()))
		{
			meta.put("code", 0);
			meta.put("mess", "Not add new category");
		}
		else
		{
			newCate.setName(category.getName());
			newCate.setParentId(category.getParentId());
			getCategoryService().createCategory(newCate);
			
			meta.put("code", 1);
			meta.put("mess", "Successful ddd new category");
		}
		
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
	
	@RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response)
	{
		HashMap<String, Object> meta = new HashMap<String, Object>();
		String id= request.getParameter("id");
		if(id != null)
		{
			getCategoryService().deleteCategory(Integer.parseInt(id));
			
			meta.put("code", 1);
			meta.put("mess", "Successful ddd new category");
		}
		else
			meta.put("code", 0);
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
	
	@RequestMapping(value="/loadProductOfCategory",method=RequestMethod.POST)
	public void loadCategory(HttpServletRequest request, HttpServletResponse response)
	{
		String id = request.getParameter("id");
		List<Product> list = new ArrayList<Product>();
		List<HashMap> listProduct = new ArrayList<HashMap>();
		list = getCategoryService().getProductOfCategory(Integer.parseInt(id));
		for(int i = 0; i < list.size(); i++)
		{
			HashMap<String,Object> product = new HashMap<String, Object>();
			product.put("id", list.get(i).getId());
			product.put("name", list.get(i).getName());
			product.put("description", list.get(i).getDescription());
			product.put("price", list.get(i).getPrice().getPrice());
			listProduct.add(product);
		}
		
		String json = new Gson().toJson(listProduct);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private boolean validateInput(Category category)
	{
		
		return true;
	}
	
	
	
}
