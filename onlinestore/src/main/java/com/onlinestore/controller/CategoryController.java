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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.onlinestore.model.Category;
import com.onlinestore.model.OsUser;
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
		if(parent.length() > 1)
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
	
	
}
