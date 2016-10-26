package com.springstudy.service.basic.httpclient;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gmk.framework.common.utils.HttpClientUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xgjt on 16/4/14.
 */
public class Httpclient {
    public static void main(String[] args) {

        //HttpClientUtils.doGet
        String xghrhosturl="hr.xiangguang.com";
        String jsonstring = HttpClientUtils.doGet(xghrhosturl + "/api/common/json/getPersonPernrByLoginName/" + "fangsen.wei");

        //json字符串转JSONObject
        JSONObject result = JSON.parseObject(jsonstring);
    }
}
