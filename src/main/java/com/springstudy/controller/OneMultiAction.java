package com.springstudy.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OneMultiAction extends MultiActionController {
	
	public ModelAndView execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		System.err.println("hello, Multi...execute....");
		return new ModelAndView("two");
	}
}
