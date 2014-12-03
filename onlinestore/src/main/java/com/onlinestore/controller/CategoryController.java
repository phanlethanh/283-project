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
import com.onlinestore.service.impl.CategoryServiceImpl;
import com.onlinestore.service.impl.OsUserServiceImpl;

@Controller
public class CategoryController {
	
	private CategoryServiceImpl getCategoryService()
	{
		ApplicationContext appCtx = 
	    		new ClassPathXmlApplicationContext("beans-service.xml");
		CategoryServiceImpl categoryService = 
	    		(CategoryServiceImpl)appCtx.getBean("categoryService");
	    return categoryService;
	}
	@RequestMapping (value="/homes")
	public ModelAndView index(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		view.setViewName("admin");
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		ck_user = getItemCookies(cookie,"os_username");
		if(ck_user != null)
		{
			if(ck_user.equals("admin"))
				view.setViewName("admin");
			HttpSession session = request.getSession();
			synchronized(session){
				session.setAttribute("os_username", ck_user);
			}
			
		}
		request.setAttribute("message", "message");
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "home");
		view.addObject("message", meta);
		return view;
	}
	@RequestMapping(value="/admin")
	public ModelAndView admin()
	{
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "admin");
		return new ModelAndView("admin","message",meta);
	}
	
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public void category(HttpServletRequest request,HttpServletResponse response )
	{
		
		String[] type = request.getParameterValues("type");
		String parent = request.getParameter("parent");
		String[] types = type[0].split(" ");
		parent = parent.substring(1);
		System.out.print(parent);
		List<HashMap> list = new ArrayList<HashMap>();
		List<Category> list1 = new ArrayList<Category>();
		list1 = getCategoryService().getCategories();
		System.out.print(list1.size());
		for(int i=0; i <types.length; i++)
		{
			if(types[i].equals("categorys") || types[i].equals("category"))
			{
				
				
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
	private String getItemCookies(Cookie[] list,String key)
	{
		if(list != null)
		{
			for(int i = 0;i < list.length; i++)
			{
				if(list[i].getName().equals(key))
					return list[i].getValue();
			}
		}
		
		return null;
	}
	
}
