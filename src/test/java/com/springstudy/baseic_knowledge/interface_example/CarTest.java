package com.springstudy.baseic_knowledge.interface_example;

import org.junit.After;
import org.junit.Test;

import static org.junit.Assert.*;

public class CarTest {

    @After
    public void tearDown() throws Exception {
        System.out.println("after");
    }

    @Test
    public void testStart() throws Exception {
        System.out.println("发动机器");
    }

    @Test
    public void testRun() throws Exception {
        System.out.println("开始跑");
    }

    @Test
    public void testStop() throws Exception {
        System.out.println("停止");
    }
}