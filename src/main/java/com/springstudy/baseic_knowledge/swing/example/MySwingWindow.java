package com.springstudy.baseic_knowledge.swing.example;

import javax.swing.*;

/**
 * Created by xgjt on 15/11/27.
 */
public class MySwingWindow extends JFrame {

    public MySwingWindow(){
        super();
        this.setSize(400,300);
        this.getContentPane().setLayout(null);
        this.setTitle("测试");
    }

    public static void main(String[] args) {
        MySwingWindow mySwingWindow = new MySwingWindow();
        mySwingWindow.setVisible(true);
    }
}
