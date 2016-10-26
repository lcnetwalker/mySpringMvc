package com.springstudy.dao;

import com.springstudy.model.User;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by xgjt on 15/6/15.
 */


public interface UserDao {

    public int insertUser(User user);

    public void deleteUserById(int id);

    public int getMatchCount(String username,String password);

    public User findUserById(int id);

    public User findUserByUsernameAndPass(String query);

    public List<User> findUserByUsername(String username);

    public void  updateUserById(User user);
}
