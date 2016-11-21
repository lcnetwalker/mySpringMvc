<%@ tag language="java" pageEncoding="UTF-8" description="内容头部信息" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageTitles" type="java.lang.String" required="false" description="标题" %>
<%@ attribute name="pageSmallTitles" type="java.lang.String" required="false" description="小标题" %>
<%--<c:if test="${not empty pageTitles}">--%>
    <%--<c:set var="pageTitle" value="${pageTitles}"/>--%>
<%--</c:if>--%>
<%--<c:if test="${not empty pageSmallTitles}">--%>
    <%--<c:set var="pageSmallTitle" value="${pageSmallTitles}"/>--%>
<%--</c:if>--%>
<%--<!-- BEGIN PAGE HEADER-->--%>
<%--<!-- BEGIN PAGE TITLE-->--%>
<%--<h3 class="page-title"> ${pageTitle}--%>
    <%--<small>${pageSmallTitle}</small>--%>
<%--</h3>--%>
<%--<!-- END PAGE TITLE-->--%>
<%--<!-- BEGIN PAGE BAR -->--%>
<div class="page-bar">
    ${breadcrumb}
</div>
<!-- END PAGE BAR -->
<!-- END PAGE HEADER-->