package com.springstudy.utils;

import org.apache.commons.beanutils.ConvertUtils;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 工作流相关工具
 * @author henryyan
 *
 */
public class WorkflowUtils {
	
	// 类型缩写与实际类型对应
	public static Map<String, Class> types = new HashMap<String, Class>();
	
	static {
		types.put("B", Boolean.class);
		types.put("L", Long.class);
		types.put("D", Double.class);
		types.put("S", String.class);
		types.put("List", List.class);
	}
	

	/**
	 * 从Request中解析流程变量
	 * @param request
	 * @return
	 */
	public static Map<String, Object> getVariables(HttpServletRequest request) {
		Map<String, Object> variables = new HashMap<String, Object>();
    	
		// 页面变量参数的前缀
		String variablePrefix = "v_";
		
		// 逐个判断页面参数是否符合变量规则，如果符合把字符类型转换为实际类型
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();			
			if (name.startsWith(variablePrefix)) {
				String[] params = name.split("_");
				if (params.length == 3) {
					String type = params[1];
					String parameterName = params[2];
					String value = request.getParameter(name);
					
					// 转换为实际类型
					Class typeClass = types.get(type);
					if(typeClass.equals(List.class)) {
						if(value.length() > 2) {
							value = value.substring(1);
							value = value.substring(0, value.length() - 1);
							String[] split = value.split(","); 
							if(split != null && split.length > 0) {
								List<String> asList = new ArrayList<String>();
								for(String item : split) {
									asList.add(item.trim());
								}
								
								variables.put(parameterName, asList);
							}
							
						}
						
					}
					else {
						Object varValue = ConvertUtils.convert(value, typeClass);						
						variables.put(parameterName, varValue);
					}
					
					
					
				}
			}
		}
		return variables;
	}
	
	/**
	 * 从Reqeust中获取批注
	 * @param request
	 * @return
	 */
	public static Map<String, String> getComments(HttpServletRequest request) {
		Map<String, String> comments = new HashMap<String, String>();
		
		// 页面变量参数的前缀
		String commentPrefix = "c_";
		
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			if (name.startsWith(commentPrefix)) {
				String[] params = name.split("_");
				if (params.length == 2) {
					String type = params[1];
					String value = request.getParameter(name);
					comments.put(type, value);
				}
			}
		}
		
		return comments;
	}
	
	public static String parseToZhType(String type) {
        Map<String, String> types = new HashMap<String, String>();
        types.put("userTask", "用户任务");
        types.put("serviceTask", "系统任务");
        types.put("startEvent", "开始节点");
        types.put("endEvent", "结束节点");
        types.put("exclusiveGateway", "条件判断节点(系统自动根据条件处理)");
        types.put("inclusiveGateway", "并行处理任务");
        types.put("callActivity", "子流程");
        return types.get(type) == null ? type : types.get(type);
    }
	
}
