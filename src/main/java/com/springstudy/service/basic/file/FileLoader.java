package com.springstudy.service.basic.file;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by xgjt on 15/10/19.
 */
public class FileLoader {

    private  String filedir="";

    public FileLoader(String filedir) {
        this.filedir = filedir;
    }

    public  void loadFile(){

        //资源加载器
        DefaultResourceLoader resourceloader = new DefaultResourceLoader();

        //要用 反斜杠
//        Resource resource = resourceloader.getResource("classpath:\\jdbc.properties");
        Resource resource = resourceloader.getResource(filedir);

        try{
            if (resource!=null){
                InputStream inputStream = resource.getInputStream();
                //创建输入流的预估长度到buffer中
                byte[] buffer = new byte[inputStream.available()];
                //将输入流写入buffer中
                inputStream.read(buffer);

                String fileStr = new String(buffer);

                inputStream.close();
                System.out.println(fileStr);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        FileLoader propertiesLoader = new FileLoader("classpath:\\jdbc.properties");
        propertiesLoader.loadFile();

    }
}
