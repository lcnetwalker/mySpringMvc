<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh-CN" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh-CN" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-CN">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <%--<title>Platform-<sitemesh:title/></title>--%>
    <title>养殖信息标准化管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${staticServer}/static/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${staticServer}/static/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${staticServer}/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${staticServer}/static/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet"
          type="text/css"/>
    <link href="${staticServer}/static/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- table start -->
    <link href="${staticServer}/static/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticServer}/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- table end -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="${staticServer}/static/assets/global/css/components.min.css" rel="stylesheet" id="style_components"
          type="text/css"/>
    <%--<link href="${staticServer}/static/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>--%>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="${staticServer}/static/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticServer}/static/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css"
          id="style_color"/>
    <link href="${staticServer}/static/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME LAYOUT STYLES -->
    <link href="${ctx}/static/css/custom.css" rel="stylesheet" type="text/css">
    <link href="${staticServer}/static/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticServer}/static/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <sitemesh:head/>

    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>
</head>
<!-- END HEAD -->

<body class="page-header-fixed page-sidebar-closed-hide-logo">
<%--<page:applyDecorator name="topmenu"/>--%>
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <%--<page:applyDecorator name="sliderbar"/>--%>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <sitemesh:body/>
    </div>
    <!-- END CONTENT -->
    <page:applyDecorator name="pagequick"/>
</div>
<!-- END CONTAINER -->
<%--<page:applyDecorator name="footer"/>--%>
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

<!-- table start -->
<script src="${staticServer}/static/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!-- table end -->


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
<%--<script src="${staticServer}/static/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>--%>

<script src="${staticServer}/static/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/jquery-validation/js/localization/messages_zh.min.js"
        type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${staticServer}/static/assets/global/plugins/bootbox/bootbox.min.js"
        type="text/javascript"></script>
<script src="${ctx}/static/js/custom.js" type="text/javascript"></script>
<sitemesh:getProperty property="page.myJavascript"/>

<script type="text/javascript">
    window.onerror = function(msg,url,line,col,error){
        //没有URL不上报！上报也不知道错误
        if (msg != "Script error." && !url){
            return true;
        }
        //采用异步的方式
        //我遇到过在window.onunload进行ajax的堵塞上报
        //由于客户端强制关闭webview导致这次堵塞上报有Network Error
        //我猜测这里window.onerror的执行流在关闭前是必然执行的
        //而离开文章之后的上报对于业务来说是可丢失的
        //所以我把这里的执行流放到异步事件去执行
        //脚本的异常数降低了10倍
        setTimeout(function(){
            var data = {};
            //不一定所有浏览器都支持col参数
            col = col || (window.event && window.event.errorCharacter) || 0;
            data.url = url;
            data.line = line;
            data.col = col;
            if (!!error && !!error.stack){
                //如果浏览器有堆栈信息
                //直接使用
                data.msg = error.stack.toString();
            }else if (!!arguments.callee){
                //尝试通过callee拿堆栈信息
                var ext = [];
                var f = arguments.callee.caller, c = 3;
                //这里只拿三层堆栈信息
                while (f && (--c>0)) {
                    ext.push(f.toString());
                    if (f  === f.caller) {
                        break;//如果有环
                    }
                    f = f.caller;
                }
                ext = ext.join(",");
                data.msg = ext;
            }
            //把data上报到后台！
            console.log(JSON.stringify(data));
        },0);
        return true;
    };
</script>
</body>

</html>