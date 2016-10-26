package test;

import org.junit.Test;

import java.math.BigDecimal;

/**
 * Created by xgjt on 15/7/1.
 */
public class TestDecimal {

    @Test
    public  void testDecimal(){
        BigDecimal  B1=new BigDecimal("0.00");
        BigDecimal bb = new BigDecimal("123.123");
        BigDecimal b = B1.add(bb);
        System.out.print(B1);
    }
}
