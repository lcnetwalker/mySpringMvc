package com.springstudy.service.test.decorate_decorate;

/**
 * Created by xgjt on 15/8/11.
 */
public abstract class PhoneDecorate implements Phone {

    //传递一个具体的手机过来
    private Phone phone;

    public PhoneDecorate(Phone phone){
        this.phone=phone;
    }

    @Override
    public void Call() {
        this.phone.Call();
    }
}
