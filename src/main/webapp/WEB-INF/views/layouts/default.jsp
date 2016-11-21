<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<!--[if IE 8]> <html lang="" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<meta charset="utf-8"/>
<title><sitemesh:title/></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
      type="text/css"/>
<link href="${staticServer}/WEB-INF/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${staticServer}/static/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${staticServer}/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${staticServer}/static/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="${staticServer}/static/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
      type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="${staticServer}/static/assets/global/css/components.min.css" rel="stylesheet" id="style_components"
      type="text/css"/>
<link href="${staticServer}/static/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="${staticServer}/static/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
<link href="${staticServer}/static/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css"
      id="style_color"/>
<link href="${staticServer}/static/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>

<%--<link href="${staticServer}/static/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>--%>
<%--<link href="${staticServer}/static/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet"--%>
<%--type="text/css"/>--%>
<sitemesh:head/>
<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed ">
<%--<page:applyDecorator name="topmenu"/>--%>
<%@ include file="/WEB-INF/views/include/topmenu.jsp" %>
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
<div class="page-container">
    <%--<page:applyDecorator name="sliderbar"/>--%>
    <%@ include file="/WEB-INF/views/include/sliderbar.jsp" %>
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">
            <%--<page:applyDecorator name="themepanel"/>--%>
            <%@ include file="/WEB-INF/views/include/themepanel.jsp" %>
            <sitemesh:body/>
        </div>
        <!-- END CONTENT BODY -->
    </div>
    <!-- END CONTENT -->
    <%--<page:applyDecorator name="pagequick"/>--%>
    <%@ include file="/WEB-INF/views/include/pagequick.jsp" %>
</div>
<%--<page:applyDecorator name="footer"/>--%>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!--[if lt IE 9]>
<script src="${staticServer}/static/assets/global/plugins/respond.min.js"></script>
<script src="${staticServer}/static/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->

<!-- BEGIN CORE PLUGINS -->
<script src="${staticServer}/static/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${staticServer}/static/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="${staticServer}/static/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->


<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${staticServer}/static/assets/global/plugins/bootstrap-table-master/bootstrap-table.min.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${staticServer}/static/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>

<script src="${staticServer}/static/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
type="text/javascript"></script>

<sitemesh:getProperty property="page.myJavascript"/>

</body>
</html>
