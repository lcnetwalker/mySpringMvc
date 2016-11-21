<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta content="Content-Type" content="text/html; charset=utf-8">
 <title>首页</title>
 </head>
 <body>
 ${name} 
 <br>
 <p>views/user/index.jsp 封装的数据是:<%=request%></p>
 name内容：${requestScope.name}
 <br>
 command内容： ${requestScope.command}

<c:if test="${username ne null}">
 ${username}，欢迎你！
</c:if>

 </body>
 </html>