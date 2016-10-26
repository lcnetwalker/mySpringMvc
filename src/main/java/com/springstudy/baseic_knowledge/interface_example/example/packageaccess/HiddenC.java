package com.springstudy.baseic_knowledge.interface_example.example.packageaccess;

import com.springstudy.baseic_knowledge.interface_example.example.interfaces.A;

/**
 * Created by xgjt on 15/9/15.
 */
public class HiddenC {

    public static A makeA(){
        return new C();
    }
}
