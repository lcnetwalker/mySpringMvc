package com.springstudy.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 测试拦截器(基于AOP)
 * 实现HandlerInterceptor，实现3个方法
 * Created by xgjt on 15/8/7.
 */

public class HandlerInterceptor1 implements HandlerInterceptor {

    int i=0;
    /**
     *  进入Handler方法之前 执行
     * 用于身份认证和身份授权
     * 比如身份认证：如果认证通过表示用户已登录，需要此方法拦截不再向下执行
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        //return false 表示拦截，向下执行
        //return true 表示放行
        return true;
    }

    /**
     * 执行Handler之后，返回ModelAndView之前 执行
     * 应用场景，从modelAndView出发
     * 例如：公用的模型数据(比如菜单导航)，在这里传到视图，也可以统一指定视图
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        i++;
        System.out.println("拦截器执行！！！！！！"+i);
    }

    /**
     * 执行Handler之后 执行
     * 应用场景：统一的异常处理，统一的日志处理
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
