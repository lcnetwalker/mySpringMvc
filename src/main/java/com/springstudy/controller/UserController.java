package com.springstudy.controller;

import com.alibaba.fastjson.JSONObject;
import com.springstudy.exception.CustomException;
import com.springstudy.interceptor.HandlerInterceptor1;
import com.springstudy.model.User;
import com.springstudy.service.UserServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by xgjt on 15/7/6.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserServiceImple userServiceImple;

    @RequestMapping("index")
    public String index(HttpServletRequest req) throws CustomException {

        HttpSession session = req.getSession();

//            throw new CustomException("我的异常");
        UUID uuid = UUID.randomUUID();


        return "index";
    }

    @RequestMapping("register")
    public String register(){
        return "user/register";
    }

    @RequestMapping(value = "user.html",method = RequestMethod.POST)
    public ModelAndView createUser(User user,
                                   MultipartFile upfile) throws IOException {

        if (upfile!=null){
            //存储图片的路径
            String path="/Users/xgjt/gmkt/";
            //图片原来名称
            String originalFilename = upfile.getOriginalFilename();
            //新的图片名称
            String newfileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
             //新图片
            File newfile = new File(path + newfileName);

            //存入磁盘
            upfile.transferTo(newfile);
        }
        userServiceImple.insertUser(user);
        //userService.insertUser(user);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("user/createSuccess");

        return  mav;
    }

    @RequestMapping("edit/{name}")
    public ModelAndView edit(@PathVariable String name,HttpServletRequest req){

        List<User> users = userServiceImple.findUserByUsername(name);
        User user = users.get(0);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("user/register");
        mav.addObject("user", user);
        return  mav;
    }

    /**
     * 查看用户
     * @param req
     * @return
     */
    @RequestMapping("showuser")
    public String showuser(HttpServletRequest req){

        String id = req.getParameter("id");

        Integer integer = Integer.valueOf(id);

        User u = userServiceImple.findUserById(integer);

        req.setAttribute("user", u);
        return "user/register";
    }

    /**
     * 查看所有用户
     * @param modle
     * @param nm
     * @return
     *
     * 通过@RequestParam里面指定request传入参数名称和形参进行绑定
     * 通过required属性指定参数必须要传入
     * 通过defaultValue可以设置成默认值，如果id参数没有传入，将默认值和形参绑定
     */
    @RequestMapping("showusers")
    public String showusers(Model modle,@RequestParam(value = "nm",required = true,defaultValue = "") String nm){

        List<User> us = userServiceImple.findUserByUsername(nm);

        modle.addAttribute("list",us);
        return "user/users-list";
    }

    /**
     *RestFul格式访问
     * @PathVariable为路径中的参数
     * @param modle
     * @param nm
     * @return
     */
    @RequestMapping("showusers/{nm}")
    public String showusers_rest(Model modle,@PathVariable("nm")  String nm){

        List<User> us = userServiceImple.findUserByUsername(nm);

        modle.addAttribute("list",us);
        return "user/users-list";
    }


    /**
     * 页面重定向 redirect
     * @return
     */
    @RequestMapping(value="redirect",method = {RequestMethod.GET,RequestMethod.POST})
    public String redirect(){
        return "redirect:showusers?nm=b";
    }

    /**
     * 页面跳转  forward        request 参数可以共享给forward后的controller
     * @return
     */
    @RequestMapping(value="forward",method = {RequestMethod.GET,RequestMethod.POST})
    public String forward(HttpServletRequest req){
        return "forward:showusers";
    }


    /**
     * 返回Json数据
     * @return
     */
    @RequestMapping("json")
    public void json(HttpServletResponse response) throws IOException {
        JSONObject json=new JSONObject();
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        List<User> list=new ArrayList<User>();

        User u1=new User();
        u1.setUsername("username1");
        u1.setUserid("userid1");

        User u2=new User();
        u2.setUsername("username2");
        u2.setUserid("userid2");

        list.add(u1);list.add(u2);

        json.put("u",list);
        String s = json.toJSONString();
        response.getWriter().write(s);

    }

    @RequestMapping("json1")
    public @ResponseBody List<User> json1(HttpServletResponse response) throws IOException {
        JSONObject json=new JSONObject();
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        List<User> list=new ArrayList<User>();

        User u1=new User();
        u1.setUsername("username1");
        u1.setUserid("userid1");

        User u2=new User();
        u2.setUsername("username2");
        u2.setUserid("userid2");

        list.add(u1);list.add(u2);
        return list;
//        json.put("u",list);
//        String s = json.toJSONString();
//        response.getWriter().write(s);

    }
}
