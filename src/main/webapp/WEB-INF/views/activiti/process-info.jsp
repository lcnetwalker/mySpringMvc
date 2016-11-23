<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default" />
<link rel="stylesheet" type="text/css" href="${ctx }/static/assets/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css">

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
					<%-- 
					<ul class="nav nav-tabs">
						<li><a href="${ctx }/activiti/process/list"><lable class="fa fa-list-alt"></lable>流程列表</a></li>
					</ul>
					--%>
					<!--begin 标签内容 -->
					<div class="tab-content">
						<div class="tab-pane active" id="panel-272984">
							<form id="inputForm" action="#" enctype="multipart/form-data" method="post" class="form-horizontal">
							
							<!--表单内容-->
							<div class="portlet box">
								<div class="portlet-body" style="display:;">
									<div class="table-responsive">
										
											<div class="form-body">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">流程KEY</label>
															<div class="col-md-6">
																<input type="text" class="form-control " readonly="readonly" value="${definition.key }"/>
															</div>
															
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">流程名称</label>
															<div class="col-md-6">
																<input type="text" class="form-control " readonly="readonly" value="${definition.name }"/>
															</div>
															
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">流程版本</label>
															<div class="col-md-6">
																<input type="text" class="form-control " readonly="readonly" value="${definition.version }"/>
															</div>

														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">状态</label>
															<div class="col-md-6">
																<input type="text" class="form-control " readonly="readonly" value='${definition.suspended eq "false" ? "运行中" : "暂停" }'/>
															</div>
															
														</div>
													</div>
												</div>
												
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">操作</label>
															<div class="col-md-6">
																<a target="_blank" href="resources/xml/${definition.id}">查看XML</a> &nbsp;&nbsp;&nbsp;&nbsp;
																<a target="_blank" href="resources/image/${definition.id}">流程图</a> &nbsp;&nbsp;&nbsp;&nbsp;
																
																<a href="${ctx }/activiti/process/download/image/${definition.id}"
																	onMouseOver="$(this).tooltip('show')"
																	data-toggle="tooltip" title="下载流程图PNG" data-placement="top">
																	下载流程图PNG
																</a>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<a href="${ctx }/activiti/process/download/xml/${definition.id}"
																	onMouseOver="$(this).tooltip('show')"
																	data-toggle="tooltip" title="下载流程图XML" data-placement="top">
																	下载流程图XML
																</a>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<c:if test='${definition.suspended eq "false" }'>
																	<a href="${ctx }/activiti/suspend/${definition.id}">暂停使用流程</a>
																</c:if>
																<c:if test='${definition.suspended eq "true" }'>
																	<a href="${ctx }/activiti/activate/${definition.id}">启用流程</a>
																</c:if>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<a target="_blank" href="${ctx }/activiti/deployment/delete/${definition.deploymentId}"
																	onMouseOver="$(this).tooltip('show')"
																	onclick="return confirm('确认要删除吗？', this.href)"
																	data-toggle="tooltip" title="删除" data-placement="top">
																	<li class="fa fa-trash-o"></li>
																</a>
															</div>
															
														</div>
													</div>
												</div>
												
											</div>
										
									</div>
								</div>
							</div>
							
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end PAGE CONTENT-->
	</div>
</body>
</html>
<content tag="myJavascript">
 	<script type="text/javascript">
		jQuery(document).ready(function() {
			
			App.init(); // initlayout and core plugins
			//FormFileUpload.init();
			
			$('.demo-loading-btn')
		      .click(function () {  
		    	//layer.load('请稍候...', 3);             
		        var btn = $(this)
				btn.attr({"disabled":"disabled"}) //解除click绑定，然后隐藏。.hide()
		        btn.button('loading')
		        setTimeout(function () {
		          btn.button('reset')
		        }, 3000)
		    })
		});
				
	</script> </content>
