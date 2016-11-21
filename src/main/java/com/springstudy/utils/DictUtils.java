/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.springstudy.utils;

import com.gmk.framework.common.utils.*;
import com.gmk.framework.dao.DictDAO;
import com.gmk.framework.model.Dict;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import java.util.List;
import java.util.Map;

/**
 * 字典工具类
 * @author zzh
 * @version
 */
public class DictUtils {
	
	private static DictDAO dictDao = SpringContextHolder.getBean(DictDAO.class);
	
	public static String getDictLabel(String value, String type, String defaultValue){
		if (com.gmk.framework.common.utils.StringUtils.isNotBlank(type) && com.gmk.framework.common.utils.StringUtils.isNotBlank(value)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && value.equals(dict.getValue())){
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel){
		if (com.gmk.framework.common.utils.StringUtils.isNotBlank(type) && com.gmk.framework.common.utils.StringUtils.isNotBlank(label)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && label.equals(dict.getLabel())){
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}
	
	public static List<Dict> getDictList(String type){
        List<Dict> dictList = dictDao.getDictList(type);
        if (dictList == null){
            dictList = Lists.newArrayList();
        }
        return dictList;
	}
	
}
