<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta content="Content-Type" content="text/html; charset=utf-8">
 <title>Insert title here</title>
 </head>
 <body>
 ${name} 
 <br>
 <p>封装的数据是:<%=request%></p>
 name内容：${requestScope.name}
 <br>
 command内容： ${requestScope.command}
 </body>
 </html>