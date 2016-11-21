package com.springstudy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gmk.framework.common.utils.HttpClientUtils;
import com.springstudy.exception.CustomException;
import com.springstudy.model.User;
import org.springframework.core.Constants;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by xgjt on 16/2/25.
 */

@Controller
@RequestMapping("")
public class SystemController  {

    private JavaMailSender mailSender;

    @RequestMapping("")
    public String index(HttpServletRequest req) throws CustomException {

        User u = new User();

        u.setUsername("管理員");
        u.setCredits(1000);
        req.setAttribute("user", u);


        u.setUserid("fangsen.wei");
        String xghrhosturl="http://192.168.5.140:8086";
        //通过字符串获取返回json 字符串
        //HttpClientUtils.doGet
        String jsonstring = HttpClientUtils.doGet(xghrhosturl + "/api/common/json/getPersonPernrByLoginName/" + u.getUserid());

        //json字符串转JSONObject
        JSONObject result = JSON.parseObject(jsonstring);
        String pernr = (String)result.get("pernr");
        System.out.println(pernr);

        Map<String,String> maps = new HashMap<>();
        maps.put("a","a1");
        maps.put("b","b1");

        Collection<String> values = maps.values();


        String format = String.format("Attribute \\'%s\\' is of type [%s], but [%s] was expected. Cause: ", new Object[]{"1", "2", "3"});
        System.out.println(format);



        System.out.println();

        //输出异常
        try{

        }catch (Exception e){
            e.printStackTrace();
        }

        return "main";
    }
}
