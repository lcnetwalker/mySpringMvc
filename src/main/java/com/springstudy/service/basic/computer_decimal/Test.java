package com.springstudy.service.basic.computer_decimal;

import com.gmk.framework.common.utils.DateUtils;
import com.gmk.framework.common.utils.NumberUtil;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.BeanUtils;

import javax.xml.ws.handler.MessageContext;
import java.beans.Expression;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xgjt on 15/9/24.
 */
public class Test {
    public static void main(String[] args) {

        double d_1 = 4.23832;
        double d_2 = 3.1673;
        double d_3 = 4.011;

        //加法
        double add = NumberUtil.add(d_1, d_2);
        System.out.println("求和："+add);

        //减法
        double sub = NumberUtil.sub(d_1, d_2);
        System.out.println("求差："+sub);

        //乘法
        double mul = NumberUtil.mul(d_1, d_2);
        System.out.println("求积："+mul);

        //除法
        double div = NumberUtil.div(d_1, d_2);
        System.out.println("求商："+div);

        //小数点3位 四舍五入
        String s1 = NumberUtil.formatToString(d_1, "#.###");
        String s2 = NumberUtil.formatToString(d_2, "#.##");
        String s3 = NumberUtil.formatToString(d_3, "#.##");

//        System.out.println("四舍五入："+s1);
//        System.out.println("四舍五入："+s2);
//        System.out.println("四舍五入："+s3);


        float hour = 12312.12652312F;

        String hour_str = new BigDecimal(hour).setScale(2, BigDecimal.ROUND_UP).toString();
        System.out.println(hour_str);



    }
}
