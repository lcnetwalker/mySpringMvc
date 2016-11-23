<%--
  Created by IntelliJ IDEA.
  User: xgjt
  Date: 15/7/6
  Time: 下午6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<tags:pageContentHead />
<form id="searchForm" class="form-horizontal form-bordered"
      action="${ctx }/user/showusers">

</form>
  <table id="tbl" class="table table-striped table-bordered table-advance table-hover table-condensed">
    <thead>
      <th>序号</th>
      <th>id</th>
      <th>用户名</th>
      <th>姓名</th>
      <th>abc【都是1】</th>
      <th>操作</th>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="item"  varStatus="vtt">
      <tr>
      <td>${vtt.index+1}</td>
      <td>${item.id}</td>
      <td>${item.userid}</td>
      <td>${item.username}</td>
      <td>${item.abc}</td>
      <td>
        <a href="/user/edit/${item.username}">编辑</a>
      </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <div>
    <tags:pagination page="${pageInfo}" />
  </div>
</body>
</html>
<content tag="myJavascript">
  <script type="text/javascript">
  jQuery(document).ready(function () {
    $.pagination = {
      turnPage: function (pageSize, pageNo) {
        $("#pageNo").val(pageNo);
        $("#pageSize").val(pageSize);
        $("#searchForm").attr("action", "${ctx}/user/showusers");
        $("#searchForm").submit();
      }
    }
  });
</script>
</content>

