<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ attribute name="key" type="java.lang.String" required="true" description="key" %>
<c:if test="${not empty key}"><fmt:message key="${key}" bundle="${i18n}"/></c:if>