<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tagss" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="http://java.sun.com/jsp/jstl/functionss" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functionsc" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="basePath" value='<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>'/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<fmt:setBundle basename="/i18n/message" var="i18n"/>
