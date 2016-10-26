package com.springstudy.service.test.extends_tst;

/**
 * Created by xgjt on 15/8/13.
 */
public class ExtendsAbstract extends AbstractClass {
    @Override
    public void abstract_Sysout() {
        System.out.println("继承了抽象类，必须实现抽象类中的抽象方法");
    }

    /**
     * 复写抽象类中的非抽象方法
     */
    @Override
    public void Sysout() {
        System.out.println("开始复写");
        super.Sysout();
        System.out.println("。。。。。。");
        System.out.println("复写结束");
    }
}
