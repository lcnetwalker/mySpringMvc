<%@page import="com.gmk.framework.common.utils.UserUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include/taglib.jsp" %>
<html>
<head>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx }/assets/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
</head>
<body>
<!-- BEGIN PAGE CONTAINER-->
<div class="container-fluid">
    <!-- BEGIN PAGE HEADER-->
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <!-- <h3 class="page-title">流程申请的名称</h3> -->
            <!--breadcrumb 自动获取面包屑路径  -->
            ${breadcrumb }
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row-fluid profile">
        <div class="span12">
            <div class="tabbable tabbable-custom tabbable-full-width">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">
                        <lable class="fa fa-list-alt"></lable>
                        新凤祥代办报账申请</a></li>
                    <li><a href="${ctx }/agpay/agpay/draftlist">
                        <lable class="fa fa-retweet"></lable>
                        我的申请</a></li>
                </ul>
                <%-- <%@ include file="oamenu.jsp"%> --%>
                <!--begin 标签内容 -->
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-272984">

                        <h2 class="page-title text-center btn margin-top-10">新凤祥代办报账申请</h2>

                        <form id="inputForm" action="" enctype="multipart/form-data" method="post"
                              class="form-horizontal">
                            <input type="hidden" id="id" name="id" value="${app.id }"/>
                            <input type="hidden" id="taskId" name="taskId" value="${taskId }"/>
                            <input type="hidden" id="taskDefinitionKey" name="taskDefinitionKey"
                                   value="${taskDefinitionKey }"/>
                            <input type="hidden" id="proc_inst_id" name="proc_inst_id" value="${app.proc_inst_id }"/>
                            <input type="hidden" id="flag" name="flag" value="${flag }"/>
                            <input type="hidden" id="isEnd" name="isEnd" value="${isEnd }"/>
                            <input type="hidden" id="postid_c" name="postid_c" value="${postid }"/>
                            <input type="hidden" id="hasloaddata" name="hasloaddata" value=""/>
                            <input type="hidden" id="loginName" name="loginName"
                                   value="<%=UserUtils.getUser().getLoginName() %>"/>
                            <input type="hidden" id="businessistrue" name="businessistrue" value=""/>
                            <input type="hidden" id="cwlevle" name="cwlevle" value=""/>
                            <input type="hidden" id="m_deoutmoney" name="m_deoutmoney" value="false" />

                            <%--不需要退回按钮的环节--%>
                            <input type="hidden" id="notneedback" name="notneedback" value="usertaskN" />

                            <!--选择岗位  -->
                            <%--<%@ include file="/views/activiti/positionsel.jsp" %>--%>
                            <!--end  选择岗位  -->


                            <!-- 申请人基本信息 -->
                            <%--<%@ include file="/views/activiti/proposer.jsp" %>--%>
                            <!-- end  申请人基本信息 -->

                            <!--表单内容-->
                            <%@ include file="basic.jsp" %>

                            <!--end 表单内容  -->
                            <!--start 附件上传 -->
                            <%--<%@ include file="/views/activiti/flowfile.jsp" %>--%>
                            <!--end 附件上传 -->

                            <!--流转意见  -->
                            <c:if test="${not empty app.proc_inst_id }">
                                <%--<%@ include file="/views/activiti/commentlist.jsp" %>--%>
                            </c:if>
                            <!--end  流转意见  -->

                            <!--start 填写意见 -->
                            <c:if test="${flag eq 'handle' || flag eq 'resubmit'}">
                                <%--<%@ include file="/views/activiti/commentfill.jsp" %>--%>
                            </c:if>
                            <!--end 填写意见 -->

                            <!-- 提交按钮 -->
                            <%--<c:if test="${flag eq 'add' || flag eq 'edit' }">--%>
                                <%--<%@ include file="/views/activiti/btn-draft.jsp" %>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${flag eq 'resubmit' }">--%>
                                <%--<%@ include file="/views/activiti/btn-resubmit.jsp" %>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${flag eq 'afterWithdraw' }">--%>
                                <%--<%@ include file="/views/activiti/btn-afterWithdraw.jsp" %>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${flag eq 'handle' }">--%>
                                <%--<%@ include file="/views/activiti/btn-handle.jsp" %>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${flag eq 'view' }">--%>
                                <%--<%@ include file="/views/activiti/btn-view.jsp" %>--%>
                            <%--</c:if>--%>
                            <!-- 提交按钮 -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none"><input id="erer" value="${message }"></div>
    <!-- end PAGE CONTENT-->
</div>
</body>
</html>
<content tag="myJavascript">
    <script src="${ctx }/assets/activiti/date.js"/>
    <script src="${ctx }/assets/scripts/json_parse.js"></script>
    <script src="${ctx }/assets/plupload-2.1.2/js/plupload.full.min.js"></script>
    <script src="${ctx }/assets/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
    <script src="${ctx }/assets/plupload-2.1.2/js/i18n/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/assets/plugins/ckeditor/ckeditor.js"></script>
    <!--
 	<script src="${ctx }/assets/uploadify/jquery.uploadify.min.js"></script>
 	 -->

    <script type="text/javascript">
        jQuery(document).ready(function () {

            App.init(); // initlayout and core plugins
            //FormFileUpload.init();


            //select2 选人接口
            $("#m_fpostid").select2({
                placeholder: "",

                //minimumInputLength: 0,
                multiple: false,
                ajax: {
                    url: '/activiti/flowpage/json/findPersonAndPosition',
                    dataType: 'json',
                    data: function (term, page) {

                        return {
                            q: term,
                            page_limit: 10, // page size
                            page: page,
                            isMain: true	//查询主岗
                        };
                    },

                    results: function (data, page) {

                        var more = (page * 10) < data.total;
                        return {
                            results: data.list, more: more
                        };
                    }
                },
                id: function (object) {

                    return object.postid;
                },
                formatResult: formatResultPerpos,
                formatSelection: formatSelectionPerpos,
                initSelection: function (element, callback) {

                    var postid = $(element).val();

                    if (postid != null && postid != '') {

                        $.ajax("/activiti/flowpage/json/findPersonAndPositionItem", {
                            data: {
                                postid: postid
                            },
                            dataType: "json"
                        }).done(function (data) {
                            callback(data.person);
                        });

                    }

                }
                //dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
                //escapeMarkup: function (m) { return m; }
            });

            function formatResultPerpos(node) {
                return  node.login_name + '-' + node.nachn + "-" + node.stext;
            };

            function formatSelectionPerpos(node) {
                initPsnInfo(node);
                return node.login_name + '-' + node.nachn + "-" + node.stext;
            };



            //页面加载 默认岗位信息加载
            $(document).live("positioninit", function (event, postid) {
                initpage(postid);
            });

            //更改岗位后，加载岗位信息
            $(document).live("positionchange", function (event, postid) {
                initpage(postid);
            });


            var zt = '';

            $(document).live("btnclick", function (event, btnId) {
                zt = btnId;
            });

            var btnAU = {
                formId: "inputForm",
                processDefinitionKey: "gmk_agpay",   //流程KEY
                bussinessKey: "${app.id}",
                proc_inst_id: $("#proc_inst_id").val(),  //流程实例ID
                startuserpostid: "${app.postid}",   //流程发起人岗位ID
                applyTaskDefinitionKey: "usertask1",  //申请环节Task的Key
                directLeaderTaskDefinitionKey: "usertask2",   //直接领导的Task的Key，抽单用
                taskid: "${taskId}",

                formSaveUrl: "${ctx}/agpay/agpay/save",  //保存草稿URL
                formStartFlowUrl: "${ctx}/agpay/agpay/start",  //发起流程 URL
                formReSaveUrl: "${ctx}/agpay/agpay/savehandle",   //重新提交环节、保存时URL
                formReSubmitUrl: "${ctx}/agpay/agpay/complete",  //重新提交环节、提交时URL
                formReCloseUrl: "${ctx}/agpay/agpay/complete",  //重新提交环节、结束流程时URL
                formHandleSaveUrl: "${ctx}/agpay/agpay/savehandle", //办理环节、保存时URL
                formHandleSubmitUrl: "${ctx}/agpay/agpay/complete", //办理环节、提交时URL
                formHandleBackUrl: "${ctx}/agpay/agpay/complete", //办理环节、退回时URL
                formWithdrawSubmitUrl: "${ctx}/agpay/agpay/complete", //抽单后，重新提交时URL
                <%--formPrintUrl:"/views/pdf/viewer.jsp?file=/agpay/agpay/print/${app.id }",--%>
                formPrintUrl: "${ctx}/agpay/agpay/printhtml/${app.id }",

                formSaveFunc: null,  //申请环节、保存需要插入运行的方法
                formStartFlowFunc: subfunc,  //申请环节、提交需要插入运行的方法
                formReSaveFunc: subfunc,  //重新提交环节、保存需要插入运行的方法
                formReSubmitFunc: subfunc,  //重新提交环节、提交需要插入运行的方法
                formReCloseFunc: subfunc,  //重新提交环节、退回需要插入运行的方法
                formHandleSaveFunc: subfunc,  //办理环节、保存时需要插入运行的方法
                formHandleSubmitFunc: subfunc,  //办理环节、提交时需要插入运行的方法    formHandleSubmitFunc
                formHandleBackFunc: formHandleBackFunc,    //办理环节、退回时需要插入运行的方法
                formWithdrawSubmitFunc: null //抽单后，重新提交时需要运行的方法
            };

            if ($("#flag").val() == "add"
                    || $("#flag").val() == "edit"
                    || $("#flag").val() == "resubmit"
                    || $("#flag").val() == "afterWithdraw") {
                initfile(btnAU, 'edit');
            }
            else {
                initfile(btnAU);
            }

            if (typeof initBtnDraft == 'function') {
                initBtnDraft(btnAU);
            }

            if (typeof initBtnHandle == 'function') {
                //不需要退回按钮的环节
                var notneedback=$("#notneedback").val();
                if ($("#taskDefinitionKey").val() == notneedback) {
                    btnAU.formHandleBackUrl = "";
                }
                initBtnHandle(btnAU);
            }
            if (typeof initBtnReSubmit == 'function') {
                initBtnReSubmit(btnAU);
            }
            if (typeof initBtnView == 'function') {
                initBtnView(btnAU);
            }
            if (typeof initBtnAfterWithDraw == 'function') {
                initBtnAfterWithDraw(btnAU);
            }


            function formHandleBackFunc() {
                if ($("#comment").val() == "") {
                    alert("退回时意见不能为空!");
                    $(this).focus();
                    return false;
                }
                return true;
            }

            //根据加载的岗位编号，初始化一些数据
            function initpage(postid) {
                $("#postid_c").val(postid);

                if (postid != null && postid != "") {
                    //页面加载运行
                    initPageInfo(postid);
                }

            }


            //inituser("${app.pernr}", "${app.appid}", "${app.appda}");  //npernr,appid,appda    加载申请用户信息

            if ($("#flag").val() == "add"
                    || $("#flag").val() == "edit"
                    || $("#flag").val() == "resubmit"
                    || $("#flag").val() == "afterWithdraw") {

                initpositions("${app.pernr}", "${app.postid}", "${app.appda}");  //npernr,postid,appda  加载岗位列表
            }
            else {
                initpositions("${app.pernr}", "${app.postid}", "${app.appda}", "view");  //npernr,postid,appda  加载岗位列表
            }


            if ($("#proc_inst_id").val() != null && $("#proc_inst_id").val() != "") {

                initcomments($("#proc_inst_id").val(), "${app.postid}", "${app.appda}"); //proc_inst_id  加载批注列表
            }
            if (typeof initdraftcomment == 'function') {

                initdraftcomment($("#taskId").val()); //taskid   加载草稿批注
            }


            $("#inputForm").validate({
                //onsubmit:true,// 是否在提交是验证,默认:true
                //onfocusout:true,// 是否在获取焦点时验证,默认:true
                //onkeyup :true,// 是否在敲击键盘时验证,默认:true
                //onclick:true,
                //focusCleanup:false,
                focusInvalid: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block',
                //errorElement: 'span', //default input error message container
                //errorClass: 'help-block', // default input error message class
                //focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                submitHandler: function (form) {
                    if (zt == "btn_start"
                            || zt == "btn_handle_submit"
                            || zt == "btn_handle_back"
                            || zt == "btn_resubmit"
                            || zt == "btn_close"
                            || zt == "btn_withdraw_submit") {
                        //移除disabled样式


                        $(".disab").removeAttr("disabled");

                        $.ajax({
                            type: 'post',
                            url: '${ctx}/agpay/agpay/json/nextassignee',
                            dataType: 'json',
                            data: $("#inputForm").serialize(),
                            success: function (res) {
                                var errmsg = res.error;
                                if (errmsg != null && errmsg != "") {
                                    alert(errmsg);
                                    return;
                                }
                                if (confirm(res.msg, this.href)) {

                                    //移除disabled样式
                                    $(".disab").removeAttr("disabled");

                                    form.submit();
                                    layer.load('请稍候...', 3);
                                }else{
                                    if(zt != "btn_start"&&
                                            zt == "btn_resubmit"&&
                                            zt == "btn_withdraw_submit"
                                    ){
                                        //添加diabled属性
                                        $(".disab").attr("disabled", "disabled");
                                    }
                                }

                            },
                            error: function (xhr, err, ex) {
                                alert("系统运行异常");
                            }
                        });

                    }
                    else if (zt == "btn_save" || zt == "btn_resave" || zt == "btn_handle_save") {
                        //$("#inputForm").attr("action", "${ctx}/app/app/save");


                        //移除disabled样式
                        $(".disab").removeAttr("disabled");


                        form.submit();
                        layer.load('请稍候...', 3)
                    }
                },
                rules: {
                    m_fpostid: {
                        required: true,
                        maxlength:20,
                        number:true
                    },
                    m_costid: {
                        required: function(){
                            if($("input[name='m_butype']")[0].checked==true){
                                return true
                            }else{
                                return false
                            }
                        }
                    },
                    m_dfinum: {
                        required: function(){
                            //一般办理环节(非[抽单后、重新提交])
                            var flag=$("#flag").val();
                            if(flag!="handle"){
                                return true;
                            }else{
                                return false;
                            }
                        }
                    },
                    m_paytp:{
                        required:function(){
                            var taskDefinitionKey = $("#taskDefinitionKey").val();
                            var isagree = $("#v_B_isagree").val();
                            //某个流转环节
                            if(taskDefinitionKey=="payment"){//出纳
                                //退回时不验证
                                if(isagree!="true"){
                                    return false;
                                }
                                return true;
                            }else{
                                return false;
                            }
                        }
                    },

                    m_ordernum:{//内部订单号
                        required:function(){
                            //单选框 选中后验证
                            if($("input[name='m_butype']")[1].checked==true){
                                return true
                            }else{
                                return false
                            }
                        }
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit
                    $('.alert-danger', $('.inputForm')).show();
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                },
                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },
                messages: {
// 		    		begda: {
// 		    			remote: jQuery.format("开始日期不在岗位的有效期内!")
// 		    		},

                }
            });

            $('.demo-loading-btn')
                    .click(function () {
                        //layer.load('请稍候...', 3);
                        var btn = $(this)
                        btn.attr({"disabled": "disabled"}) //解除click绑定，然后隐藏。.hide()
                        btn.button('loading')
                        setTimeout(function () {
                            btn.button('reset')
                        }, 3000)
                    })


        });

        //页面加载时运行
        function initPageInfo(postid){
            //初始化动态表格显示
            initTblDisp();
            //初始化页面数据
            initData();

        }





        function initData(){

            //金额大写初始化
            setChinese($("input[name='txf_fee']"),$("input[name='txf_fee_dx']"));//通讯费

        }




        //提交的时候验证  非空判断
        function subfunc() {
            return true;
        }


        //select2选人之后加载数据
        function initPsnInfo(node) {

            var flag = $("#flag").val();

            if (flag == "add" || flag == "edit" || flag == "afterWithdraw" || flag == "resubmit") {

            }

        }


        //动态表格显示初始化
        function initTblDisp(){

            var checkbox = $("input[name='m_retp']:checked");

            //付款信息隐藏显示控制
            var taskDefinitionKey = $("#taskDefinitionKey").val();
            var isEnd = $("#isEnd").val();


        }

        //设置金额大写
        function Chinese(num){
            if(!/^\d*(\.\d*)?$/.test(num))throw(new Error(-1, "Number is wrong!"));
            var AA = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");
            var BB = new Array("","拾","佰","仟","萬","億","圆","");
            var CC = new Array("角", "分", "厘");
            var a = (""+ num).replace(/(^0*)/g, "").split("."), k = 0, re = "";
            for(var i=a[0].length-1; i>=0; i--){
                switch(k){
                    case 0 : re = BB[7] + re; break;
                    case 4 : if(!new RegExp("0{4}\\d{"+ (a[0].length-i-1) +"}$").test(a[0]))
                        re = BB[4] + re; break;
                    case 8 : re = BB[5] + re; BB[7] = BB[5]; k = 0; break;
                }
                if(k%4 == 2 && a[0].charAt(i)=="0" && a[0].charAt(i+2) != "0") re = AA[0] + re;
                if(a[0].charAt(i) != 0) re = AA[a[0].charAt(i)] + BB[k%4] + re; k++;
            }
            if(a.length>1){
                re += BB[6];
                for(var i=0; i<a[1].length; i++){
                    re += AA[a[1].charAt(i)] + CC[i];
                    if(i==2) break;
                }
                if(a[1].charAt(0)=="0" && a[1].charAt(1)=="0"){
                    re+="元整";
                }
            }else{
                re+="元整";
            }
            return re;
        }

        //设置金额大写 je为金额input，jedx为金额大写input
        function setChinese(je,jedx){

            var je_v = $(je).val().replace(/\s+/g,'');//过滤空格
            if(je_v!=""){
                var jx = Chinese(je_v);
                $(jedx).val(jx);
            }

        }

    </script>
</content>
