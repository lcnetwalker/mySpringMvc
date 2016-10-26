package com.springstudy.baseic_knowledge.enum_type.example;

/**
 * Created by xgjt on 15/11/27.
 */
public enum Week {
    MONDAY("MON"), TUESDAY("TUES"), WEDNESDAY("WED"), THURSDAY("THUR"),
    FRIDAY("FRI"), SATURDAY("SAT"), SUNDAY("SUN");

    private String abbr;
    //声明的一个字符串，用于保存缩写信息

    private Week(String abbr) {
        this.abbr=abbr;
    }

    //通过该方法获得枚举元素的缩写
    public String getAbbr() {
        return abbr;
    }
}
