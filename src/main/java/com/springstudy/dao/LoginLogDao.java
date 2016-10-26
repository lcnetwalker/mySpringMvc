package com.springstudy.dao;

import com.springstudy.model.LoginLog;
import com.springstudy.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xgjt on 15/6/15.
 */
@Repository     //通过Spring注解定义一个DAO
public class LoginLogDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertLoginLog(LoginLog loginlog){
        String sqlStr="INSERT INTO  t_login_log(user_id,ip,login_datetime) " +
                " VALUES(?,?,?) ";
        Object[] args={loginlog.getUserid(),loginlog.getIp(),loginlog.getLogindate()};
        jdbcTemplate.update(sqlStr,args);
    }
}
