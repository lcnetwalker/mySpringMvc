package mybatis;

import com.alibaba.fastjson.JSON;
import com.springstudy.model.User;
import com.springstudy.service.IUserService;
import com.springstudy.service.UserServiceImple;
import org.apache.log4j.Logger;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by xgjt on 15/7/10.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
public class MybatisTest {

    private  static final Logger logger = Logger.getLogger(MybatisTest.class);

    @Autowired
    private IUserService userService;

    @Test
    public void del(){
        userService.deleteUserById(8);
    }

    @Ignore
    public void update(){
        User u=new User();
        u.setId(9);
        u.setUsername("xiaoqiang");
        u.setCredits(1000000);
        userService.updateUserById(u);
    }
    @Ignore
    public void select(){
        List<User> users = userService.findUserByUsername("123");
        logger.info(JSON.toJSON(users));
//        System.out.println("name:"+no2.getUsername());
//        System.out.println("id:"+no2.getUserid());
//        System.out.println("pass:"+no2.getPassword());
    }
    @Test
    public  void insert(){
        User user=new User();
        user.setUserid("a");
        user.setUsername("a1");
        user.setPassword("1-9");
        user.setCredits(123);
        int i = userService.insertUser(user);
        System.out.println("ID:"+user.getId());

    }

    @Ignore
    public void changeuser(){
        User user=new User();
        user.setUsername("acccc");
        user.setCredits(123123212);
        user.setId(9);
        userService.updateUserById(user);
    }

    @Ignore
    public void finduserById(){
        User user = userService.findUserById(9);
        System.out.println(user.getCredits());
    }
}
