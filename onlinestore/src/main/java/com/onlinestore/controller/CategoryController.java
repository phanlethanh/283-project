package com.onlinestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {
	
	@RequestMapping (value="/homes")
	public ModelAndView index()
	{
		System.out.print("abc");
		String message = "Home-Page";
		return new ModelAndView("home","message",message);
	}
	
}
