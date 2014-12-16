package com.onlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
	
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(com.onlinestore.controller.OsUserController.class); 
	private OsUserServiceImpl getUserService()
	{
		ApplicationContext appCtx = 
	    		new ClassPathXmlApplicationContext("beans-service.xml");
	    OsUserServiceImpl userService = 
	    		(OsUserServiceImpl)appCtx.getBean("osUserService");
	    return userService;
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login(@ModelAttribute OsUser user,HttpServletRequest request, HttpServletResponse respose)
	{
		
		HashMap<String, Integer> meta = new HashMap<String, Integer>();
		int code = 0;
		OsUserServiceImpl userService = getUserService();
		List<OsUser> list_user = new ArrayList<OsUser>();
		list_user = userService.getOsUsers();
		for(int i = 0; i < list_user.size(); i++)
		{
			if(list_user.get(i).getUsername().equals(user.getUsername())&& list_user.get(i).getPassword().equals(user.getPassword()))
			{
				code = 2;
				if(user.getUsername().equals("admin") && user.getPassword().equals("admin"))
				{
					code = 1;
					System.out.print("1");
				}
				
				if(request.getParameter("login_save") != null &&request.getParameter("login_save").equals("on"))
				{
					Cookie cookie_user = new Cookie("os_username",list_user.get(i).getUsername());
					Cookie cookie_pass = new Cookie("os_password",list_user.get(i).getPassword());
					cookie_user.setMaxAge(60*60*60);
					cookie_pass.setMaxAge(60*60*60);
					cookie_user.setPath("/");
					cookie_pass.setPath("/");
					respose.addCookie(cookie_user);
					respose.addCookie(cookie_pass);
					
				}
				HttpSession session = request.getSession();
				synchronized(session){
					session.setAttribute("os_username", list_user.get(i).getUsername());
					session.setAttribute("os_userid", list_user.get(i).getId());
				}
				log.info("User "+list_user.get(i).getUsername()+" loging");
			}
			
			
		}
		meta.put("code", code);
		String json = new Gson().toJson(meta);
		respose.setContentType("application/json");
		respose.setCharacterEncoding("UTF-8");
		try {
			respose.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		session.removeAttribute("os_username");
		session.removeAttribute("os_userid");
		Cookie[] cookie = request.getCookies();
		for(int i = 0; i < cookie.length; i++)
		{
			if(cookie[i].getName().equals("os_username") || cookie[i].getName().equals("os_password"))
			{
				cookie[i].setMaxAge(0);
				cookie[i].setPath("/");
				response.addCookie(cookie[i]);
			}
		}
		
		response.sendRedirect("homes.html");
		
	}
	private boolean checkUserIsAdmin(Integer id)
	{
	    OsUserServiceImpl userService = getUserService(); 
	    		
        OsUser user = userService.getOsUser(id);
        if(user != null)
        	return true;
		return false;
	}
	
	
}
