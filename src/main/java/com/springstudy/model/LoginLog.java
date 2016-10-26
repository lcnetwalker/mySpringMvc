package com.springstudy.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by xgjt on 15/6/15.
 */
public class LoginLog implements Serializable {

    private int loginlogid;
    private String  userid;
    private String ip;
    private Date   logindate;


    public int getLoginlogid() {
        return loginlogid;
    }

    public void setLoginlogid(int loginlogid) {
        this.loginlogid = loginlogid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getLogindate() {
        return logindate;
    }

    public void setLogindate(Date logindate) {
        this.logindate = logindate;
    }
}
