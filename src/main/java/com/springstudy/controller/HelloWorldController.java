package com.springstudy.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Created by xgjt on 15/6/5.
 */
//请求访问 6：运行该controller，并返回ModelAndView
public class HelloWorldController implements Controller {

    @Override
    public ModelAndView handleRequest(javax.servlet.http.HttpServletRequest httpServletRequest, javax.servlet.http.HttpServletResponse httpServletResponse) throws Exception {
        //1、收集参数、验证参数
        // 2、绑定参数到命令对象
        // 3、将命令对象传入业务对象进行业务处理
        // 4、选择下一个页面
        ModelAndView mv=new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject("message","SpringMVC 你好，这是通过配置文件生成的访问");
        mv.setViewName("hello");
        return mv;
    }
}
