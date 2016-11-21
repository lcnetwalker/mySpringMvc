package com.springstudy.utils;

import com.gmk.framework.common.utils.*;
import org.apache.commons.lang3.*;
import org.apache.commons.lang3.StringUtils;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by zzh on 2014/5/24.
 */
public class ComparisonUtil {

    /**
     * 比较两个对象差异数据
     * @param beforeobj
     * @param afterobj
     * @param cols 比较字段
     * @param different 差异？
     * @return
     * @throws Exception
     */
    public static List<com.gmk.framework.common.utils.Comparison> compareobj(Object beforeobj,Object afterobj,Map<String, String> cols,boolean different) throws Exception{
        List<com.gmk.framework.common.utils.Comparison> sames = new ArrayList<com.gmk.framework.common.utils.Comparison>();
        List<com.gmk.framework.common.utils.Comparison> differents = new ArrayList<com.gmk.framework.common.utils.Comparison>();
        if(beforeobj==null) throw new Exception("beforeobj不能为空!");
        if(afterobj==null) throw new Exception("afterobj不能为空!");
        if(!beforeobj.getClass().isAssignableFrom(afterobj.getClass())){
            throw new Exception("两个对象不相同，无法比较");
        }
        //去除对象所有字段
        PropertyDescriptor[] descriptors = Introspector.getBeanInfo(beforeobj.getClass()).getPropertyDescriptors();
        Set<String> keys = cols.keySet();
        for (String col : keys) {
            for (PropertyDescriptor descriptor : descriptors) {
                String proname = descriptor.getName();
                if(org.apache.commons.lang3.StringUtils.isNotEmpty(proname)&&proname.equalsIgnoreCase(col)){
                    com.gmk.framework.common.utils.Comparison comparison = new com.gmk.framework.common.utils.Comparison();
                    Method readmethod = descriptor.getReadMethod();
                    comparison.setBefore(readmethod.invoke(beforeobj));
                    comparison.setAfter(readmethod.invoke(afterobj));
                    comparison.setFieldType(descriptor.getPropertyType());
                    comparison.setField(proname);
                    comparison.setFieldName(cols.get(col));
                    if(comparison.isdifferent()){
                        sames.add(comparison);
                    }else{
                        differents.add(comparison);
                    }
                }
            }
        }
        if(different){
            return differents;
        }else{
            return sames;
        }
    }
}
