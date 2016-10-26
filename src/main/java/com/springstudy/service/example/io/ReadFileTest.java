package com.springstudy.service.example.io;

import java.io.*;

/**
 * Created by xgjt on 15/11/26.
 */
public class ReadFileTest {

    public static void readFile(){
        try {
            FileInputStream file = new FileInputStream("/Users/xgjt/Desktop/code.txt");

            int data=0;
            try {
                while ((data = file.read()) != -1) {
                    System.out.println(data);
                }

                file.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void readFile(String s){
        try {
            FileReader file = new FileReader("/Users/xgjt/Desktop/code.txt");
            int data=0;
            try {
                while ((data=file.read())!=-1){
                    System.out.println((char)data);
                }
                file.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void readFile(String s,String ss){

        try {
            try {
                BufferedReader read = new BufferedReader(new InputStreamReader(new FileInputStream("/Users/xgjt/Desktop/code.txt"), "UTF-8"));
                try {
                    while (read.readLine()!=null){
                        System.out.println(read.readLine());
                    }
                    read.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args) {
        readFile("","");
    }
}
