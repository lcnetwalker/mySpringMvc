package com.springstudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by xgjt on 15/6/8.
 */
@Controller                                             //1、将一个pojo类声明为一个处理器
@RequestMapping("/study")   //处理器的通用映射前缀
public class HelloWorld_zjController {
    @RequestMapping(value={"/hello_zj","hello"},method = RequestMethod.GET)                        //2、请求URL到处理器功能处理方法的映射
    public ModelAndView helloworld(){
        //1、收集参数
        //2、绑定参数到命令对象
        //3、调用业务对象
        //4、选择下一个页面
        ModelAndView mv=new ModelAndView();
        mv.addObject("message","这是注解实现的控制器");
        mv.setViewName("hello");
        return mv;
  }

    @RequestMapping("/hello/{id}")
    public ModelAndView helloworld1(HttpServletRequest req){

        String id = req.getParameter("id");

        ModelAndView mv=new ModelAndView();
        mv.addObject("message","这是注解实现的控制器-带参数"+id);
        mv.setViewName("hello");
        return mv;
    }
    @RequestMapping(value="/request/ContentType",method = RequestMethod.POST,headers = "Content-Type=application/json")
    public String request2(HttpServletRequest request) throws IOException{
        //1、表示请求的内容区数据位json数据
        InputStream is=request.getInputStream();
        byte bytes[] = new byte[request.getContentLength()];
        is.read(bytes);
        String jsonStr =new String(bytes,request.getCharacterEncoding());
        System.out.println("json data:"+jsonStr);
        return  "success";
    }
}
