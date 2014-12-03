package com.onlinestore.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {
	
	@RequestMapping (value="/homes")
	public ModelAndView index(HttpServletRequest request)
	{
		
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		ck_user = getItemCookies(cookie,"os_username");
		if(ck_user != null)
		{
			HttpSession session = request.getSession();
			synchronized(session){
				session.setAttribute("os_username", ck_user);
			}
			
		}
		String message = "home";
		return new ModelAndView("home","message",message);
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
