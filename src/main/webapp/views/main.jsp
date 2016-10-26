<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>网站首页</title>
</head>

<script src="../assets/scripts/money.js"></script>
<body>
${user.username},欢迎你登录网站，您当前积分：${user.credits}
<input name="ipt" value="123">


<div class="tab-content">
    <div class="tab-pane active  ">
        <div class="portlet">
            <div class="portlet-body form">
                <ul class="nav nav-tabs">
                    <li>
                        <a href="http://www.baidu.com">aaa</a>
                    </li>
                    <li>
                        <a href="http://www.baidu.com">aaa</a>
                    </li>
                    <li>
                        <a href="http://www.baidu.com">aaa</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" language="JavaScript">
    jQuery(document).ready(function() {


        alert(convertCurrency(123))
    })

</script>
</body>
</html>