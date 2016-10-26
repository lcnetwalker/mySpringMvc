package com.springstudy.service.example;

import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import java.io.IOException;

/**
 * Created by xgjt on 15/7/1.
 */
public class PattemResolverTest {
    public  static void main(String[] args) throws IOException {
        //资源加载器(ResourceLoader)实现类
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        //加载所有类包com.springstudy及子孙包下的以xml为后缀的资源
        Resource[] resources = resolver.getResources("classpath*:com/springstudy/**/*.xml");
        for (Resource r:resources){
            System.out.print(r.getDescription());
        }
    }
}
