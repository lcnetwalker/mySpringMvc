<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default" />
<link rel="stylesheet" type="text/css" href="${ctx }/assets/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
<!-- 
<link rel="stylesheet" type="text/css" href="${ctx }/assets/uploadify/uploadify.css">
 -->
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
						<li><a href="${ctx }/activiti/process/list"><lable class="fa fa-list-alt"></lable>流程列表</a></li>
						<li class="active"><a href="javascript:;"><lable class="fa fa-list-alt"></lable>流程部署</a></li>
					</ul>
					<%-- <%@ include file="oamenu.jsp"%> --%>
					<!--begin 标签内容 -->
					<div class="tab-content">
						<div class="tab-pane active" id="panel-272984">
							<form id="inputForm" action="${ctx }/activiti/process/deploy" enctype="multipart/form-data" method="post" class="form-horizontal">
							
							<!--表单内容-->
							<div class="portlet box">
								<div class="portlet-body" style="display:;">
									<div class="table-responsive">
										
											<div class="form-body">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label class="col-md-4 control-label">选择流程图(zip、bar、bpmn、bpmn20.xml)</label>
															<div class="col-md-6">
																<input type="file" name="file" id="file" class="form-control "/>
															</div>
															
														</div>
													</div>
												</div>
												
											</div>
										
									</div>
								</div>
							</div>
							<div class="form-group margin-top-10">
								<div class="col-md-offset-5 col-md-4 row">
									<button class="demo-loading-btn btn blue" id="btn_save" 
										data-loading-text="部署中..." type="button">部署</button>
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
			
			$("#btn_save").click(function(){
				$("#inputForm").submit();
			});
			
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
