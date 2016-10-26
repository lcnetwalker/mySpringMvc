package com.springstudy.service;

import com.springstudy.dao.UserDao;
import com.springstudy.model.User;
import com.springstudy.service.annotation.Hello;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
