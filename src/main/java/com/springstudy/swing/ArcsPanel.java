package com.springstudy.swing;

import javax.swing.*;
import java.awt.*;

/**
 * Created by xgjt on 16/7/15.
 */
public class ArcsPanel extends JPanel {
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setColor(Color.BLUE); //设置弧形的颜色为蓝色

        /*
        int i=0;
        int xCenter = getWidth() / 2;
        int yCenter = getHeight() / 2;
        int radius = (int)(Math.min(getWidth(), getHeight()) * 0.4);

        int x = xCenter - radius;
        int y = yCenter - radius;


        //使用while循环画弧形
        while(i<360){
            g.fillArc(x, y, 2 * radius, 2 * radius, i, 30);
            i+=90;
        }

        */

        int i=0;
        double x1=0;
        double y1=0;

        g.fillRect(100,100,100,100);

        //使用while循环画弧形
//        while(i<180){
//            g.fillArc(0, 100, 100, 100, i, 30);
//            i+=90;
//        }


    }
}
