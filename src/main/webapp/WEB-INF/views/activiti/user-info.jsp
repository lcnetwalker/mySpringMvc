<%@page import="java.util.Date"%>
<%@page import="com.gmk.framework.common.utils.DateUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<meta name="decorator" content="default3" />
</head>
<body>
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB
				<h3 class="page-title">
					用户信息
				</h3>-->
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>
		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->
		<div class="row-fluid profile">
			<div class="span12">
				<!--BEGIN TABS-->
				<div class="tabbable tabbable-custom tabbable-full-width">
					<!-- <ul class="nav nav-tabs">
						<li class="active"><a href="#"><lable class="fa fa-file-text-o"></lable>跳转</a></li>
					</ul> --> 
					
						<div class="profile-account">
							
							<div class="col-md-12">
								<div class="tab-content">
									<div class="tab-pane active">
									<div class="margin-top-8">
										<!-- BEGIN FORM-->
										<form id="inputForm" class="form-horizontal" action="#" method="post">
											<div class="form-body">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-2 control-label">ITCODE</label>
															<div class="col-md-10">
																<input id="loginName" name="loginName" class="form-control" value="${loginName }" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
											
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">姓名</label>
															<div class="col-md-8">
																<input id="nachn" name="nachn" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">姓名简拼</label>
															<div class="col-md-8">
																<input id="vorna" name="vorna" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">邮箱</label>
															<div class="col-md-8">
																<input id="email" name="email" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">移动电话</label>
															<div class="col-md-8">
																<input id="mobile" name="mobile" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">固定电话</label>
															<div class="col-md-8">
																<input id="telephone" name="telephone" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
													</div>
												</div>
												
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label  class="col-md-4 control-label">工作地点</label>
															<div class="col-md-8">
																<input id="workaddress" name="workaddress" class="form-control" placeholder="" readonly="readonly"/>
																<!-- <span class="help-block">必填项.</span> -->
															</div>
														</div>
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
	<script src="${ctx}/static/assets/scripts/myString.js" type="text/javascript" ></script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			App.init(); // initlayout and core plugins
            
            $.getJSON("${ctx}/authapi/personnel/personnel/json/getPersonnelInfoByLoginName/${loginName}", function(data){
            	$("#nachn").val(data.nachn);
            	$("#vorna").val(data.vorna);
            	$("#email").val(data.email);
            	$("#mobile").val(data.mobile);
            	$("#telephone").val(data.telephone);
            	$("#workaddress").val(data.workaddress);
            });
		});
		
	</script>
</content>