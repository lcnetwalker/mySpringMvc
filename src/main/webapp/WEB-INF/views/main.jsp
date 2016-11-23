<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>网站首页</title>
</head>

<script src="/static/assets/scripts/money.js"></script>
<body>
<div>
    ${user.username},欢迎你登录网站，您当前积分：${user.credits}
</div>
<div class="form-group">
    <input name="userid" value="">
    <a href="#" id="btn_pernr">查pernr</a>
</div>



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

//        console.log(convertCurrency(123))

        $("#btn_pernr").click(function(){
            var userid = $("[name='userid']").val();
            var url = "http://192.168.5.140:8086/api/common/json/getPersonPernrByLoginName/"+userid;
            window.open(url)
        });
    })

</script>
</body>
</html>