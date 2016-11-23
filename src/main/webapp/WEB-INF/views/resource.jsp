<%--
  Created by IntelliJ IDEA.
  User: xgjt
  Date: 15/7/1
  Time: 下午9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.page import="org.springframework.web.context.support.ServletContextResource"/>
<jsp:directive.page import="org.springframework.core.io.Resource"/>
<jsp:directive.page import="org.springframework.web.util.WebUtils"/>
<%
  //注意文件资源地址以相对于Web应用根路径的方式表示
  Resource res3=new ServletContextResource(application,"/WEB-INF/classes/helloworld.xml");
  out.print(res3.getFile()+"<br/>");
  out.print(WebUtils.getTempDir(application).getAbsolutePath());
%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
