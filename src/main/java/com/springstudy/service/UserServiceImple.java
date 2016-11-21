package com.springstudy.service;

import com.gmk.framework.common.utils.StringUtils;
import com.springstudy.dao.UserDao;
import com.springstudy.model.User;
import com.springstudy.service.annotation.Hello;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by xgjt on 15/7/10.
 */
@Service("userService")
public class UserServiceImple implements IUserService {

    @Autowired
    private  UserDao userDao;

    @Override
    @Hello(str = "abc")
    public int insertUser(User user) {
        return  userDao.insertUser(user);
    }

    @Override
    public void deleteUserById(int id) {
        userDao.deleteUserById(id);
    }

    @Override
    public int getMatchCount(String username, String password) {
        return 0;
    }

    @Override
    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public List<Map> findAllUsers() {
        return userDao.findAllUsers();
    }

    @Override
    public User findUserByUsernameAndPass(String query) {
        return userDao.findUserByUsernameAndPass(query);
    }

    @Override
    public List<User> findUserByUsername(String nm) {
        return userDao.findUserByUsername(nm);
    }

    @Override
    public void updateUserById(User user) {
        userDao.updateUserById(user);
    }


    public void saveOrupdateUser(User user) {

        if (user!=null && user.getId()!=0){
            userDao.updateUserById(user);
        }else{
            insertUser(user);
        }
    }
}
