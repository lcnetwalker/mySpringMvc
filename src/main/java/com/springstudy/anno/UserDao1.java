package com.springstudy.anno;

import org.springframework.stereotype.Component;

/**
 * Created by xgjt on 15/7/4.
 */
//通过Repository 定义一个DAO的Bean
@Component("userDao1")
public class UserDao1 {
    //...
}

//以上和xml配置是等效的
//<bean id="userDao" class="com.springstudy/anno.UserDao"/>

/**
 *  除了@Component以外，还有和其等效的3个注解：完全可以用Component替代这3个注解
 *  @Repository:    用于对DAO实现类进行标注
 *  @Service:       用于对Service实现类进行标注
 *  @Controller:    用于对Controller实现类进行标注
 */


