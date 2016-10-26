package com.springstudy.baseic_knowledge.command_model;

/**
 * Created by xgjt on 15/9/9.
 */
public class AppleCommand extends Command {

    public AppleCommand(Peddler peddler) {
        super(peddler);
    }

    @Override
    public void sail() {
        this.getPeddler().sellApple();
    }
}
