package com.springstudy.dao;

import com.springstudy.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by xgjt on 15/6/15.
 */

@Repository
public interface UserDao {

    public int insertUser(User user);

    public void deleteUserById(int id);

    public int getMatchCount(String username,String password);

    public User findUserById(int id);

    public List<Map> findAllUsers();

    public User findUserByUsernameAndPass(String query);

    public List<User> findUserByUsername(String username);

    public void  updateUserById(User user);
}
