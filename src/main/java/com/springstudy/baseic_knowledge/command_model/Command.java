package com.springstudy.baseic_knowledge.command_model;

/**
 * Created by xgjt on 15/9/9.
 */
public abstract class Command {

    private Peddler peddler;

    public Command(Peddler peddler) {
        this.peddler = peddler;
    }

    public void setPeddler(Peddler peddler) {
        this.peddler = peddler;
    }

    public Peddler getPeddler() {
        return peddler;
    }

    public abstract void sail();
}
