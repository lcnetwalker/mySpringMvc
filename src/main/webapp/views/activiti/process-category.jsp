<%@page import="java.util.Date"%>
<%@page import="com.gmk.framework.common.utils.DateUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>

	

	<meta name="decorator" content="default" />

</head>
<body>
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
					流程类别设置
				</h3>
				${breadcrumb }
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>
		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->
		<div class="row-fluid profile">
			<div class="span12">
				<!--BEGIN TABS-->
				<div class="tabbable tabbable-custom tabbable-full-width">
					<ul class="nav nav-tabs">
						<li><a href="${ctx }/activiti/process/list"><lable class="fa fa-list"></lable>流程部署</a></li>
						<li class="active"><a href="#"><lable class="fa fa-file-text-o"></lable>类别设置</a></li>
						 
					</ul>
					
						<div class="profile-account">
							
							<div class="col-md-12">
								<div class="tab-content">
									<div class="tab-pane active">
									<div class="margin-top-8">
										<!-- BEGIN FORM-->
										<form id="inputForm" class="form-horizontal" action="${ctx }/activiti/process/category-save" method="post">
											<input type="hidden" id="id" name="id" value="${category.id }" >
											<input type="hidden" id="act_key" name="act_key" value="${key}" >
											<div class="form-body">
												<div class="form-group">
													<label  class="col-md-4 control-label">类别: </label>
													<div class="col-md-4">
														<select class="form-control" id="bpm_category_id" name="bpm_category_id">
															<option>请选择</option>
															<c:forEach var="item" items="${categories }" varStatus="vstt">
																<option value="${item.id }" <c:if test="${item.id eq category.bpm_category_id }"> selected="selected"</c:if> >${item.name }</option>
															</c:forEach>
														</select>
														
														<!-- <span class="help-block">必填项.</span> -->
													</div>
												</div>
												
												
												
												<div class="form-group">
												<div class="col-md-offset-4 col-md-5 fluid margin-top-10">
													<button id="btn_save" type="button" class="btn blue" >保存</button>
													<button type="button" class="btn default" onclick="history.go(-1)">取消</button>
													
											  	</div>                            
												</div>
											</div>
											
												
											
										</form>
										<!-- END FORM--> 
										</div>
									</div>
								</div>
							</div>
							<!--end col-md-9-->
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
<content tag="myJavascript">
	<script src="${ctx}/assets/scripts/myString.js" type="text/javascript" ></script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			App.init(); // initlayout and core plugins
			
			$("#btn_save").click(function(){
				$("#inputForm").submit();
			});
			
            $("#inputForm").validate({
				//onsubmit:true,// 是否在提交是验证,默认:true  
				//onfocusout:true,// 是否在获取焦点时验证,默认:true  
				//onkeyup :true,// 是否在敲击键盘时验证,默认:true  
				//onclick:true,
				//focusCleanup:false,
				focusInvalid:true,
				errorElement: 'span', //default input error message container
        		errorClass: 'help-block',
				//errorElement: 'span', //default input error message container
                //errorClass: 'help-block', // default input error message class
                //focusInvalid: false, // do not focus the last invalid input
                ignore: "",
				submitHandler: function(form) {
					form.submit();
				},
		    	rules: {
		    		bpm_category_id: {
		    			required: true,
		    		},
		    		
		    	},
		    	invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger', $('.inputForm')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },
	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.col-md-4'));
	            },
		    	messages: {
		    		
		    	}
		    });
            
            
		});
		
	</script>
</content>