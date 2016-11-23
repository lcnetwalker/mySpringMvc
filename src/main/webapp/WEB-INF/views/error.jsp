<%@ page import="org.eclipse.jetty.server.handler.ErrorHandler" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>

<%--
  Created by IntelliJ IDEA.
  User: xgjt
  Date: 15/7/17
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
全局error页面

错误码： <%=request.getAttribute("javax.servlet.error.status_code")%> <br>
信息： <%=request.getAttribute("javax.servlet.error.message")%> <br>
异常： <%=request.getAttribute("javax.servlet.error.exception_type")%> <br>

详细异常：<%=request.getAttribute("javax.servlet.error.exception")%>

</body>
</html>
