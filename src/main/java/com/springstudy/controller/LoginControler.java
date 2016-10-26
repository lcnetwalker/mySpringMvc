package com.springstudy.controller;

import com.springstudy.model.LoginForm;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.annotation.Annotation;


@Controller            //标注成一个SpringMVC的Controller
@RequestMapping("login")
public class LoginControler {


    //登录
    @RequestMapping("index")
    public String index(){
        return  "login";
    }

    //登录
    @RequestMapping("login1")
    public String login(HttpSession session,String username,String password){

        //调用service进行认证

        //保存到session
        session.setAttribute("username",username);
        //重定向到主页面
        return "redirect:../user/index";
    }


//    @RequestMapping("")
//    public String index(){
//        return "index";
//    }
    @RequestMapping(value="/index.html")
    public String lgoin(){
        return "login";
    }
//
//    @RequestMapping(value="/logincheck.html" , method= RequestMethod.POST)
//    public ModelAndView logincheck(HttpServletRequest req,LoginCommand loginCommand){
//        boolean b = userService.hasMatchUser(loginCommand.getUsername(), loginCommand.getPassword());
//        if (!b){
//            return new ModelAndView("login","error","用户名或密码错误！");
//        }else {
//            User u = userService.findUserByUserName(loginCommand.getUsername());
//            u.setLastip(req.getLocalAddr());
//            u.setLastvisit(new Date());
//            userService.loginSuccess(u);
//            req.getSession().setAttribute("user",u);
//            return new ModelAndView("main");
//        }
//
//    }
    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response, LoginForm form) {

        Logger logger = Logger.getLogger(LoginControler.class);
        logger.debug("开始");
        logger.debug("结束");

        // 记录debug级别的信息  
        logger.debug("This is debug message");
        // 记录info级别的信息  
        logger.info("This is info message.");
        // 记录error级别的信息  
        logger.error("This is error message.");

        logger.info("写入记录");

        System.err.println("测试输出");
        String username = form.getUsername();
        ModelAndView mv = new ModelAndView("/index", "command", "LOGIN SUCCESS, " + username);
        return mv;
    }

    public Class<? extends Annotation> annotationType() {
        // TODO Auto-generated method stub
        return null;
    }

    public String value() {
        // TODO Auto-generated method stub
        return null;
    }
}
