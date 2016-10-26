package com.springstudy.baseic_knowledge.final_.final_para;

/**
 * Created by xgjt on 15/8/21.
 */
public class FinalArguments {

    void with(final Gizmo g){

        System.out.println("with()"+g);
    }

    void without(Gizmo g){

        g=new Gizmo();
        g.spin();


        System.out.println("with()"+g==null);
    }

    int g(final int i){return  i+1;}

    public static void main(String[] args){
        FinalArguments bf=new FinalArguments();
        bf.without(null);
        bf.with(null);
    }
}
