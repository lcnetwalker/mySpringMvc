package com.springstudy.service.test;

/**
 * Created by xgjt on 16/2/26.
 */
public class Test {
    public static void main(String[] args) {
        String str="刘晓东  孟涛  李元亮 谢大伟  孔凡深  张书兵 刘士祥  赵继武  管荣梅 沈三兴  王壮林  王长龙 刘振亮  郝玉申  王敏 廉宪敏  李辉  邓渝梅 崔秀梅  曹汝俊  祁茂刚 宋振中  梁雨合  王卫东 刘新波  房茂雨  王文基 殷庆飞  赵岩  胡应鸿";
        String trim = str.trim();
//        String s = trim.replaceAll("  ", " ");
        String[] split = trim.split(" ");

        System.out.println(split);
    }
}
