package com.springstudy.service.basic.bean;

/**
 * Created by xgjt on 16/5/28.
 */
public class BeanUtils {

    public static class a{
        private String username;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
    }

    public static class a1{
        private String username;
        private String password;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
    }
    public static void main(String[] args) {
            a1 a__=new a1();
            a__.username="123";
            a__.password="cc";

            a a_=new a();
        org.springframework.beans.BeanUtils.copyProperties(a__,a_);
        System.out.println(a_.username);

    }
}
