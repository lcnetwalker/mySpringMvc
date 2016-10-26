package com.springstudy.baseic_knowledge.digui_jishu;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xgjt on 15/8/28.
 */
public class TypeCounter extends HashMap<Class<?>,Integer>{
    private  Class<?> baseType;
    public TypeCounter(Class<?> baseType){
        this.baseType=baseType;
    }

    //获取其参数的Class，然后使用 isAssignableFrom()来执行运行时的检查,以校验你传递的对象确实属于我们感兴趣的继承结构
    //countClass()首先对该类的确切类型计数，然后，如果其超类可以赋值给baseType，countClass将其超类上递归计数。

    //isAssignableFrom()是用来判断一个类Class1和另一个类Class2是否相同或是另一个类的子类或接口
    public void count(Object obj){
        Class<?> type=obj.getClass();
        if(!baseType.isAssignableFrom(type))
            throw new RuntimeException(obj+" incorrect type: " +
                    type+ ", shuld be type or subtype of " +
                    baseType);
        countClass(type);
    }

    private void countClass(Class<?> type){
        Integer quantity = get(type);
        put(type,quantity == null?1:quantity+1);
        Class<?> superClass = type.getSuperclass();

        //isAssignableFrom()创建一个不局限于对Pet技术的通用工具
        if(superClass!=null &&
                baseType.isAssignableFrom(superClass)){
            countClass(superClass);
        }
    }

    public String toString(){
        StringBuilder result =new StringBuilder("{");
        for (Map.Entry<Class<?>,Integer> pair:entrySet()){
            result.append(pair.getKey().getSimpleName());
            result.append("=");
            result.append(pair.getValue());
            result.append("}");
        }
        result.delete(result.length()-2,result.length());
        result.append("}");
        return result.toString();
    }
}
