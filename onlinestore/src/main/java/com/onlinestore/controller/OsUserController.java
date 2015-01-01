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
import com.onlinestore.util.Variable;



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
					Cookie cookie_uid = new Cookie("os_userid",String.valueOf(list_user.get(i).getId()));
					cookie_user.setMaxAge(60*60*60);
					cookie_pass.setMaxAge(60*60*60);
					cookie_uid.setMaxAge(60*60*60);
					cookie_user.setPath("/");
					cookie_pass.setPath("/");
					cookie_uid.setPath("/");
					respose.addCookie(cookie_user);
					respose.addCookie(cookie_pass);
					respose.addCookie(cookie_uid);
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
			if(cookie[i].getName().equals("os_username") || cookie[i].getName().equals("os_password") 
					|| cookie[i].getName().equals("os_userid"))
			{
				cookie[i].setMaxAge(0);
				cookie[i].setPath("/");
				response.addCookie(cookie[i]);
			}
		}
		
		response.sendRedirect("homes.html");
		
	}
	
	@SuppressWarnings("unused")
	private boolean checkUserIsAdmin(Integer id)
	{
	    OsUserServiceImpl userService = getUserService(); 
	    		
        OsUser user = userService.getOsUser(id);
        if(user != null)
        	return true;
		return false;
	}
	
	@RequestMapping(value = "/userDetail")
	public ModelAndView viewCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "user";
		HttpSession session = request.getSession();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			viewName = "error";
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			OsUser user = getUserService().getOsUser(userId);
			view.addObject("id", userId);
			view.addObject("group", user.getUserGroup().getName());
			view.addObject("fullName", user.getFullName());
			view.addObject("address", user.getAddress());
			view.addObject("email", user.getEmail());
			view.addObject("phone", user.getPhone());
		}
		view.setViewName(viewName);
		return view;
	}
	
	@RequestMapping(value = "/userDetailForEdit", method = RequestMethod.POST)
	public void userDetailForEdit(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			OsUser user = getUserService().getOsUser(userId);
			map.put("fullname", user.getFullName());
			map.put("address", user.getAddress());
			map.put("email", user.getEmail());
			map.put("phone", user.getPhone());
		}
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/editUserInfo", method = RequestMethod.POST)
	public void editUserInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String fullName = request.getParameter("user_fullname");
		String address = request.getParameter("user_address");
		String email = request.getParameter("user_email");
		String phone = request.getParameter("user_phone");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			map.put("code", 0);
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			OsUser user = new OsUser();
			user.setId(userId);
			user.setFullName(fullName);
			user.setAddress(address);
			user.setEmail(email);
			user.setPhone(phone);
			// Update user
			getUserService().updateOsUser(user);
			map.put("code", 1);
			map.put("fullname", fullName);
			map.put("address", address);
			map.put("email", email);
			map.put("phone", phone);
		}
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/changeUserPassword", method = RequestMethod.POST)
	public void changeUserPassword(HttpServletRequest request,
			HttpServletResponse response) {
		String oldPassword = request.getParameter("user_old_password");
		String newPassword = request.getParameter("user_new_password");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (null == session.getAttribute(Variable.SESSION_USER_ID)) {
			// Not login
			map.put("code", 0);
		} else {
			// Logged in
			Integer userId = Integer.valueOf(session.getAttribute(
					Variable.SESSION_USER_ID).toString());
			OsUser user = getUserService().getOsUser(userId);
			if (oldPassword.compareTo(user.getPassword()) == 0) {
				user.setPassword(newPassword);
				// Update
				getUserService().updateOsUser(user);
				map.put("code", 1);
			} else { 
				// Wrong old password
				map.put("code", 2);
			}
		}
		String json = new Gson().toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
