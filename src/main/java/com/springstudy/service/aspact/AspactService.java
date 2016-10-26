package com.springstudy.service.aspact;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
* Created by xgjt on 15/7/18.
*/
@Aspect
//@Component  配置中加上了context:include-filter 此切面就不用加@Component了
public class AspactService {

    // “*”代表返回值 “..” 不管有多少函数  insertUser这个方法前、后切入该方法
//    @Before("execution(* com.springstudy.service.UserServiceImple.insertUser(..))")
//    @After("execution(* com.springstudy.service.UserServiceImple.insertUser(..))")

    @Before("@annotation(com.springstudy.service.annotation.Hello)")
    public void aspact0(){
        System.out.println("切面测试！HELLO注解前，用户插入");
    }

    @After("@annotation(com.springstudy.service.annotation.Hello)")
    public void aspact1(){
        System.out.println("切面测试！HELLO注解后，用户插入");
    }

    @Before("execution(* com.springstudy.service.UserServiceImple.insertUser(..))")
    public void aspact2(){
        System.out.println("切面测试！EXECUTION方式，用户插入前执行！");
    }


    @After("execution(* com.springstudy.service.UserServiceImple.insertUser(..))")
    public void aspact3(){
        System.out.println("切面测试！EXECUTION方式 用户插入执行！");
    }
}
