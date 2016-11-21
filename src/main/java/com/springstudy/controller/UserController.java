package com.springstudy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.alibaba.fastjson.JSONObject;
import com.gmk.framework.common.web.*;
import com.springstudy.exception.CustomException;
import com.springstudy.model.User;
import com.springstudy.service.UserServiceImple;
import com.springstudy.service.basic.string.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by xgjt on 15/7/6.
 */

@Controller
@RequestMapping("/user")
public class UserController{

    @Autowired
    UserServiceImple userServiceImple;

    @RequestMapping("index")
    public String index(HttpServletRequest req) throws Exception {

        HttpSession session = req.getSession();

//            throw new CustomException("我的异常");
        UUID uuid = UUID.randomUUID();

        String currentViewPrefix = "";
        RequestMapping requestMapping = (RequestMapping) AnnotationUtils.findAnnotation(this.getClass(), RequestMapping.class);
        if(requestMapping != null && requestMapping.value().length > 0) {
            currentViewPrefix = requestMapping.value()[0];
        }
        if(1==1){
            throw new Exception("测试");
        }

        return "/user/index";
//        return "index";
    }

    @RequestMapping("register")
    public String register(){
        return "user/register";
    }

    @RequestMapping(value = "user.html",method = RequestMethod.POST)
    public String createUser(User user,
                                   MultipartFile upfile,RedirectAttributes attr) throws IOException {

        if (upfile!=null){
            //存储图片的路径
            String path="/Users/xgjt/gmkt/";
            //图片原来名称
            String originalFilename = upfile.getOriginalFilename();
            if (StringUtils.isNotBlank(originalFilename)){
                //新的图片名称
                String newfileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
                //新图片
                File newfile = new File(path + newfileName);

                //存入磁盘
                upfile.transferTo(newfile);
            }

        }

        userServiceImple.saveOrupdateUser(user);

        attr.addFlashAttribute("message", "添加成功！");
        return  "redirect:/user/showusers";
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
    public String showusers(Model modle,@RequestParam(value = "nm",required = true,defaultValue = "") String nm,
                            @RequestParam(required = false,defaultValue = "1")int pageNo,
                            @RequestParam(required = false,defaultValue = "10")int pageSize){

        List<Map> us = userServiceImple.findAllUsers();

        PageHelper.startPage(pageNo, pageSize, true, null, true);
        PageInfo page = new PageInfo(us);

        modle.addAttribute("page",page);
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
