package com.springstudy.service.basic.collection;


import com.gmk.framework.common.utils.Collections3;
import com.springstudy.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 集合处理类
 * @author Administrator
 *
 */
public class CollectionsUtil {


    public static void main(String[] args) {

        List<User> list = new ArrayList<>();
        User u1=new User();
        u1.setUserid("uid1");
        u1.setUsername("unm1");

        User u2=new User();
        u2.setUserid("uid2");
        u2.setUsername("unm2");
        list.add(u1);
        list.add(u2);

        List list1 = Collections3.extractToList(list, "userid");
        System.out.println(list1);

        Map map = Collections3.extractToMap(list, "userid", "username");
        System.out.println(map);
    }

}
