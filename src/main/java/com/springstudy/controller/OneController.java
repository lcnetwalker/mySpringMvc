package com.springstudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class OneController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {

		resp.setContentType("text/html;charset=UTF-8");
		resp.getWriter().print("这是我第一个控制器");
		ModelAndView mv=new ModelAndView("index");
		mv = new ModelAndView("index","name","name属性的值Jack");
		mv.addObject("command", "modeAndview中commad的值");
		return mv;
	}

}
