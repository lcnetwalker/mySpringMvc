<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%> <html>

<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh"
           uri="http://www.opensymphony.com/sitemesh/decorator"%>

<head>
    <title><decorator:title default="装饰器页面..." /></title>
    <decorator:head />

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${ctx}/static/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
    <link href="${ctx}/static/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <!-- END PAGE LEVEL PLUGIN STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctx}/static/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
    <%--系统样式--%>
    <link href="${ctx}/static/assets/css/themes/green.css" rel="stylesheet" type="text/css" id="style_color"/>

    <link href="${ctx}/static/assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/jquery-jbox/2.3.1/jBox/Skins/lightcolor/jbox.css" rel="stylesheet" />
    <link href="${ctx}/static/assets/css/pages/news.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
    <!-- 下拉查询框 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/plugins/select2/select2_metro.css" />
    <!-- error -->
    <link href="${ctx}/static/assets/css/error.css" rel="stylesheet" type="text/css"/>
    <!-- error -->
    <link href="${ctx}/static/assets/css/profile.css" rel="stylesheet" type="text/css" />
    <sitemesh:head/>
    <link rel="shortcut icon" href="${ctx}/static/assets/img/favicon.ico"/>
</head>
<body>
<%--<page:applyDecorator name="topmenu"/>--%>
<%@ include file="/WEB-INF/views/include/topmenu.jsp" %>
<script src="${ctx }/static/assets/plugins/excanvas.min.js"></script>
<script src="${ctx }/static/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${ctx }/static/assets/plugins/jquery-1.10.2.min.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/jquery-migrate-1.2.1.min.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script
        src="${ctx }/static/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script
        src="${ctx }/static/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/jquery.cookie.min.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<script src="${ctx }/static/assets/scripts/app.js"></script>
<script src="${ctx }/static/assets/plugins/dateformatter.js"></script>

<script
        src="/static/assets/plugins/jquery-validation/dist/jquery.validate.min.js"
        type="text/javascript"></script>
<script
        src="/static/assets/plugins/jquery-validation/localization/messages_zh.js"
        type="text/javascript"></script>

<script src="${ctx }/static/assets/scripts/app.js"></script>
<script
        src="/static/assets/plugins/jquery-validation/dist/jquery.validate.min.js"
        type="text/javascript"></script>
<script
        src="/static/assets/plugins/jquery-validation/localization/messages_zh.js"
        type="text/javascript"></script>
<script src="${ctx }/static/assets/plugins/dateformatter.js"></script>
<h1>this is  sitemesh</h1>
<hr>
<decorator:body />
<hr>
结尾：chen56@msn.com

<sitemesh:usePage id="thePage" />
<% String myJavascript = thePage.getProperty("page.myJavascript"); %>
<% if(myJavascript != null){ %>

<sitemesh:getProperty property="page.myJavascript" />

<% } %>

<script type="text/javascript">
    $.ajaxSetup({
        // Disable caching of AJAX responses
        cache: false
    });

</script>
</body>
</html>