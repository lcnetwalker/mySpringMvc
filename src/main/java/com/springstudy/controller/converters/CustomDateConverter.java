package com.springstudy.controller.converters;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by xgjt on 15/8/5.
 */
public class CustomDateConverter implements Converter<String,Date>{
    @Override
    public Date convert(String s) {
        //实现日期转字符串 格式：yyyy-MM-dd HH:mm:ss
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return simpleDateFormat.parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  null;

    }
}
