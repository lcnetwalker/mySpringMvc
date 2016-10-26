package com.springstudy.baseic_knowledge.jdbc;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xgjt on 15/12/4.
 */
public class JdbcTest {
    // JDBC 驱动器名称 和数据库地址
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
    // JDBC 驱动器名称 和数据库地址
    static final String DB_URL="jdbc:mysql://localhost/sampledb";

    static final String USER="root";
    static final String PASS="123456";


    public static void main(String[] args) {
        Connection conn=null;
        Statement stmt=null;

        try {
            //注册JDBC驱动
            Class.forName(JDBC_DRIVER);

            System.out.println("打开连接。。。。");

            try {
                conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);

                //执行查询
                System.out.println("执行查询！");
                stmt = (Statement) conn.createStatement();
                String sql="select * from t_user";
                ResultSet rs = stmt.executeQuery(sql);
                if(rs.next()){
                    String user_id = rs.getString("user_id");
                    String user_name = rs.getString("user_name");
                    int credits = rs.getInt("credits");
                    String password = rs.getString("password");

                    System.out.println("user_id: "+user_id);
                    System.out.println("user_name: "+user_name);
                    System.out.println("credits: "+credits);
                    System.out.println("password: "+password);
                }

                //清理场地
                rs.close();
                stmt.close();
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e){
                e.printStackTrace();
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            //关闭资源
            if(stmt!=null){
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn!=null){
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("88888888888");
    }

}
