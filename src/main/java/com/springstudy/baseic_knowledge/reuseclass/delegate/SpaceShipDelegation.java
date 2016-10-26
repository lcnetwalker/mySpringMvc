package com.springstudy.baseic_knowledge.reuseclass.delegate;

/**
 * Created by xgjt on 15/8/20.
 */
public class SpaceShipDelegation {
    private String name;
    private SpaceShipControls controls=new SpaceShipControls();

    public SpaceShipDelegation(String name){
        this.name=name;
    }

    //delegated methods  代理方法
    public void back(int velocity){
        controls.back(velocity);
    }

}
