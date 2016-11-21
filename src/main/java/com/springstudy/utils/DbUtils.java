package com.springstudy.utils;

import java.sql.Connection;
import java.sql.SQLException;

import com.alibaba.druid.pool.DruidDataSource;
import com.gmk.framework.common.utils.SpringContextHolder;


/**
 * 数据库连接工具类
 * @author duanqixin
 * @date 2014年4月16日 下午5:02:13  
 * @version 
 */
public class DbUtils {
	
	public static Connection getConnection() throws SQLException {
		DruidDataSource dataSource = SpringContextHolder.getBean(DruidDataSource.class);
		Connection connection = dataSource.getConnection();
		return connection;
	}
	
	public static void close(Connection connection) throws SQLException {
		if(connection != null) {
			connection.close();
		}
	}
}