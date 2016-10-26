package com.springstudy.baseic_knowledge.command_model;

/**
 * Created by xgjt on 15/9/9.
 */
public class BananaCommand extends  Command {
    public BananaCommand(Peddler peddler) {
        super(peddler);
    }

    @Override
    public void sail() {
        this.getPeddler().sellBanana();
    }
}
