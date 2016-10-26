package com.springstudy.baseic_knowledge.command_model;

/**
 * Created by xgjt on 15/9/9.
 */
public class TestCommand {
    public static void main(String[] args) {
        Peddler peddler = new Peddler();
        Command applecommand=new AppleCommand(peddler);
        applecommand.sail();

//        Command bananacommand =new  BananaCommand(peddler);
//        bananacommand.sail();

    }
}
