package com.springstudy.service;

import com.springstudy.model.User;

import java.util.List;
import java.util.Map;

/**
 * 用户服务接口
 * Created by xgjt on 15/7/10.
 */
public interface IUserService {

    public int insertUser(User user);

    public void deleteUserById(int id);

    public int getMatchCount(String username,String password);

    public User findUserById(int id);

    public List<Map> findAllUsers();

    public User findUserByUsernameAndPass(String query);

    public List<User> findUserByUsername(String username);

    public void  updateUserById(User user);

}
