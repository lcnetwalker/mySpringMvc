package com.springstudy.swing;

import javax.swing.*;

/**
 * Created by xgjt on 16/7/15.
 */
public class DrawArcs extends JFrame {

    public DrawArcs() {
        setTitle("画弧形");
        getContentPane().add(new ArcsPanel());
    }

    /** 主方法 */
    public static void main(String[] args) {
        DrawArcs frame = new DrawArcs();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(250, 300);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
