<%--
  Created by IntelliJ IDEA.
  User: xgjt
  Date: 15/7/6
  Time: 下午6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
  <table id="tbl">
    <thead>
      <th>id</th>
      <th>用户名</th>
      <th>姓名</th>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="item"  varStatus="vtt">
      <tr>
      <td>${item.id}</td>
      <td>${item.userid}</td>
      <td>${item.username}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</body>
</html>
