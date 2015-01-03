package com.onlinestore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@RequestMapping(value = "/viewReportDashboard")
	public ModelAndView viewReportDashboard(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String viewName = "report";
		view.setViewName(viewName);
		return view;
	}
}
