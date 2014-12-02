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
import com.onlinestore.model.OsUser;
import com.onlinestore.service.impl.OsUserServiceImpl;



@Controller
public class OsUserController {
	
	
	private OsUserServiceImpl getUserService()
	{
		ApplicationContext appCtx = 
	    		new ClassPathXmlApplicationContext("beans-service.xml");
	    OsUserServiceImpl userService = 
	    		(OsUserServiceImpl)appCtx.getBean("osUserService");
	    return userService;
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login(HttpServletRequest request)
	{
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		ck_user = getItemCookies(cookie,"os_user_name");
		HashMap<String, Integer> meta = new HashMap<String, Integer>();
		if(ck_user != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("os_user_name", ck_user);
			Long id = Long.valueOf(getItemCookies(cookie,"os_user_id")).longValue();
			if(checkUserIsAdmin(id))
			{
				meta.put("code", 1);
			}
			else
			{
				meta.put("code", 2);
			}
			
		}
		else
		{
			OsUserServiceImpl userService = getUserService();
			
		}
		
		
	}
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public void register(@ModelAttribute OsUser user,HttpServletRequest request, HttpServletResponse respose)
	{
		String name = request.getParameter("username");
		
		List<String> list = new ArrayList<String>();
		list.add(user.getUsername());
		
		
	    OsUserServiceImpl userService = getUserService();
		
		userService.createOsUser(user);
		String json = new Gson().toJson(list);
		System.out.print("Name"+json);
		respose.setContentType("application/json");
		respose.setCharacterEncoding("UTF-8");
		try {
			respose.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private boolean checkUserIsAdmin(Long id)
	{
		
	    OsUserServiceImpl userService = getUserService(); 
	    		
        OsUser user = userService.getOsUser(id);
        if(user != null)
        	return true;
		return false;
	}
	private String getItemCookies(Cookie[] list,String key)
	{
		for(int i = 0;i < list.length; i++)
		{
			if(list[i].getName() == key)
				return list[i].getValue();
		}
		return null;
	}
	
}
