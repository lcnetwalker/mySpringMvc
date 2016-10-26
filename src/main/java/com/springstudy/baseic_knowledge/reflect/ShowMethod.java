package com.springstudy.baseic_knowledge.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.regex.Pattern;

/**
 * Created by xgjt on 15/8/25.
 */
public class ShowMethod {
    public static String usage=
            "usage " +
                    "showMethods qualified.classname\n" +
                    "To show all method in class or:\n" +
                    "showMethods qualified.class.name word\n" +
                    "To search for methods involving 'word'";

    private static Pattern p =Pattern.compile("\\w+\\.");


    public static void main(String[] args) {
        if (args.length<1){
            System.out.println(usage);
            System.exit(0);
        }

        int lines=0;;

        try{
            Class<?> c = Class.forName(args[0]);
            Method[] methods = c.getMethods();
            Constructor<?>[] ctors = c.getConstructors();
            if (args.length==1){
                for (Method method:methods){
                    System.out.println(p.matcher(method.toString()));
                }
                for (Constructor cotr:ctors){
                    System.out.println(p.matcher(cotr.toString()));
                }
                lines = methods.length + ctors.length;
            }else{
                for(Method method:methods)
                    if(method.toString().indexOf(args[1])!=-1){
                        System.out.println(method.toString());
                        lines++;
                    }
            }
            for(Constructor ctor:ctors)
                if(ctor.toString().indexOf(args[1])!=-1){
                    System.out.println(p.matcher(ctor.toString()).replaceAll(""));
                    lines++;
                }

        }catch (Exception e){
            System.out.println("No such class"+ e);
        }
    }
}
