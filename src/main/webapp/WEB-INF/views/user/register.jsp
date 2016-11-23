<%--
  Created by IntelliJ IDEA.
  User: xgjt
  Date: 15/7/6
  Time: 下午2:57
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增用户</title>
  <link href="/static/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="/static/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>


  <meta name="decorator" content="default" />
  <link rel="stylesheet" type="text/css" href="/static/assets/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css">

</head>
<body>
<div class="tab-content">
  <div class="tab-pane active" id="panel-272984">

<%--<form id="tbl" method="post" action="<c:url value='/user/user.html'/>">--%>
<form id="tbl" method="post" action="/user/user.html" enctype="multipart/form-data">
  <table class="form-group">

    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa  fa-wrench"></i>申请信息
        </div>
        <div class="tools">
          <a class="collapse" href="javascript:;"></a>
        </div>

      </div>
      <div class="portlet-body" style="display:;">

        <div class="form-group col-md-12 row">

          <div class="col-md-6">
            <div class="form-group">
              <label class="col-md-4 control-label">用户名</label>
              <div class="col-md-8">
                <input type="text" class="form-control userid" name="userid"
                       id="userid" value="${user.userid}" <c:if
                        test="${flag eq 'view' || flag eq 'handle' }">
                       readonly='readonly' </c:if>>
                <input hidden="" id="id" name="id" value="${user.id}">
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="col-md-4 control-label">附件数</label>
              <div class="col-md-8">
                <input type="text" class="form-control m_ftel" name="m_ftel"
                       id="m_ftel" value="${app.m_ftel}" <c:if
                        test="${flag eq 'view' || flag eq 'handle' }">
                       readonly='readonly' </c:if>>
              </div>
            </div>
          </div>

        </div>


        <div class="form-group col-md-12 row">

          <div class="col-md-6">
            <div class="form-group">
              <label class="col-md-4 control-label">密码</label>
              <div class="col-md-8">
                <input type="text" class="form-control password" name="password"
                       id="password" value="${user.password}" <c:if
                        test="${flag eq 'view' || flag eq 'handle' }">
                       readonly='readonly' </c:if>>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="col-md-4 control-label">姓名</label>
              <div class="col-md-8">
                <input type="text" class="form-control username" name="username"
                       id="username" value="${user.username}" <c:if
                        test="${flag eq 'view' || flag eq 'handle' }">
                       readonly='readonly' </c:if>>
              </div>
            </div>
          </div>

        </div>


        <div class="form-group col-md-12 row">

          <div class="col-md-6">
            <div class="form-group">
              <label class="col-md-4 control-label">文件</label>
              <div class="col-md-8">
                <input type="file" class="form-control upfile" name="upfile"
                       id="upfile"  <c:if
                        test="${flag eq 'view' || flag eq 'handle' }">
                       readonly='readonly' </c:if>>
              </div>
            </div>
          </div>

        </div>


        <div class="submit-btn form-group text-center">
          <button type="submit" class="btn blue">提交</button>
        </div>


        </div>
      </div>

  </table>





</form>
</div>
  </div>

<script src="/static/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="/static/assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="/static/assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>


</body>
</html>

<content tag="myJavascript">
  <script src="/static/assets/activiti/date.js"/>
  <script src="/static/assets/scripts/money.js"></script>
  <script src="/static/assets/scripts/json_parse.js"></script>
  <script src="/static/assets/plupload-2.1.2/js/plupload.full.min.js"></script>
  <script src="/static/assets/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
  <script src="/static/assets/plupload-2.1.2/js/i18n/zh_CN.js"></script>

  <!--
 	<script src="/static/assets/uploadify/jquery.uploadify.min.js"></script>
 	 -->

  <script type="text/javascript">
    jQuery(document).ready(function() {

    });

    $("#json_btn").click(function(){
      $.ajax({
        type:'post',
        url:'/user/json1',
        contentType:'application/json;charaset=utf-8',

        //数据格式是json串
        data:'',
        success:function(data){//返回json结果

//          $.each( data.u, function(i, n){
//            //i是索引，n是值
//            alert(n.userid)
//          });

          $.each( data, function(i, n){
            //i是索引，n是值
            alert(n.userid)
          });

        }
      });
    });

  </script>
</content>
