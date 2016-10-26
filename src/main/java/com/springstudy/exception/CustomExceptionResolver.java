package com.springstudy.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义全局异常处理器
 * 实现了HandlerExceptionResolver接口
 * e为系统抛出的异常
 * Created by xgjt on 15/8/6.
 */
@Component
public class CustomExceptionResolver implements HandlerExceptionResolver{
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                         Object o, Exception e) {

        //o就是处理器适配器要执行的Handler对象

        CustomException customException=null;
        if (e instanceof CustomException){
            customException=(CustomException)e;
        }else {
            customException=new CustomException("未知错误");
        }

        //错误信息
        String message=customException.getMessage();

        ModelAndView modelAndView=new ModelAndView();

        //错误信息展示到页面
        modelAndView.addObject("message",message);

        modelAndView.setViewName("error");

        return  modelAndView;
    }
}
