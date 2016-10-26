package com.springstudy.service.test;

import com.springstudy.service.basic.string.Rmb;



public class RmbTest {
	

	public void testrmb(){
		Rmb rmb=new Rmb(00.00);
		String hanStr = rmb.toHanStr();
		System.out.println(hanStr);




	}
}
