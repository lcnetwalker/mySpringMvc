package com.springstudy.service.example;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.util.FileCopyUtils;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by xgjt on 15/7/1.
 */
public class FileSourceExample {
    public static void  main(String[] args){
        try {
            String filePath = "/Users/xgjt/gits/spring-web/src/main/resources/helloworld.xml";

            //使用系统文件路径方式打开
            FileSystemResource res1 = new FileSystemResource(filePath);

            //使用类路径方式加载文件
            ClassPathResource res2 = new ClassPathResource("com/springstudy/helloworld.xml");

            InputStream ins1 = res1.getInputStream();
            InputStream ins2 = res2.getInputStream();

            System.out.print("res1: "+res1.getFilename());
            System.out.print("res2: "+res2.getFilename());

            //EncodedResource对资源进行编码
            EncodedResource encRes = new EncodedResource(res2, "UTF-8");
            String content = FileCopyUtils.copyToString(encRes.getReader());
            System.out.print(content);


        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
