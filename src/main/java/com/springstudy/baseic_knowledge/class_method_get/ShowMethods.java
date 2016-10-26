package com.springstudy.baseic_knowledge.class_method_get;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.regex.Pattern;

/**
 * Created by xgjt on 15/8/28.
 */
public class ShowMethods {
    private static String usage=
            "useage:\n" +
            "ShowMethods qualified.class.name\n" +
            "To show all methods in class or:\n" +
                    "ShowMethods qualified.class.name word\n" +
                    "To search for method involving 'word'\n";

    private static Pattern p=Pattern.compile("\\w+\\.");
    public static void main(String[] args) {
//        args=['123','123'];
        if(args.length<1){
            System.out.println(usage);
            System.exit(0);
        }

        int lines=0;

        try{
            Class<?> c=Class.forName(args[0]);
            Method[] methods = c.getMethods();
            Constructor<?>[] constructors = c.getConstructors();
            if (args.length==1){
                for (Method method:methods){
                    System.out.println(
                            p.matcher(method.toString()).replaceAll("")
                    );
                }
                for (Constructor ctor:constructors){
                    System.out.println(
                            p.matcher(ctor.toString()).replaceAll("")
                    );

                    lines=methods.length+constructors.length;
                }
            }else {
                for (Method method:methods){
                    if (method.toString().indexOf(args[1])!=-1){
                        System.out.println(
                                p.matcher(method.toString()).replaceAll("")
                        );
                        lines++;
                    }
                }
                for (Constructor ctor:constructors){
                    if (methods.toString().indexOf(args[1])!=-1){
                        System.out.println(
                                p.matcher(ctor.toString()).replaceAll("")
                        );

                        lines++;
                    }

                }
            }
        }catch (ClassNotFoundException e){
            System.out.println("No Such class :"+e);
        }
    }

}
