package com.onlinestore.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping (value="/homes")
	public ModelAndView index(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		String viewName = "home";
		Cookie[] cookie = request.getCookies();
		String ck_user = null;
		ck_user = getItemCookies(cookie,"os_username");
		if(ck_user != null)
		{
			if(ck_user.equals("admin"))
				viewName ="admin";
			HttpSession session = request.getSession();
			synchronized(session){
				session.setAttribute("os_username", ck_user);
			}
			
		}
		request.setAttribute("message", "message");
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "home");
		view.addObject("message", meta);
		view.setViewName(viewName);
		return view;
	}
	@RequestMapping(value="/admin")
	public ModelAndView admin()
	{
		HashMap<String, Object> meta = new HashMap<String, Object>();
		meta.put("message", "admin");
		return new ModelAndView("admin","message",meta);
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
