package com.springstudy.anno;

import com.springstudy.dao.LoginLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created by xgjt on 15/7/4.
 */
//定义一个Service的Bean
@Service
public class LogonService {

    @Autowired
    private LoginLogDao loginLogDao;

    //找不到bean也不要抛出异常
//    @Autowired(required = false)
//    private UserDao userDao;

}

