package com.springstudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class PropController extends MultiActionController {

	public void one(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		System.err.println("one....");
	}
	public void two(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		System.err.println("two....");
	}
}
