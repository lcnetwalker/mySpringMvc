<%@ page contentType="text/html;charset=UTF-8"%>
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
						<li class="active"><a href="#"><lable class="fa fa-list-alt"></lable>申请表单</a></li>
						<li><a href="${ctx }/activiti/flowpage/oatasklist"> <lable class="fa fa-retweet"></lable>任务列表</a></li>
					</ul>
					<%-- <%@ include file="oamenu.jsp"%> --%>
					<!--begin 标签内容 -->
					<div class="tab-content">
						<div class="tab-pane active" id="panel-272984">
						
						<h2 class="page-title text-center btn margin-top-10">流程申请的名称</h2>
							
							<!--选择岗位  -->
							<%@ include file="/views/activiti/positionsel.jsp"%>
							<!--end  选择岗位  -->
							
							<!--流转意见  -->
							<%@ include file="/views/activiti/commentlist.jsp"%>
							<!--end  流转意见  -->
							
							<!-- 申请人基本信息 -->
							<%@ include file="/views/activiti/proposer.jsp"%>
							<!-- end  申请人基本信息 -->

							<!--表单内容-->
							<div class="portlet box">
								<div class="portlet-title">
									<div class="caption">
										 <i class="fa  fa-wrench"></i>基本设置
									</div>
									<div class="tools">
										<a class="collapse" href="javascript:;"></a>
									</div>
								</div>
								<div class="portlet-body" style="display:;"></div>
							</div>
							<!--end 表单内容  -->
							<%@ include file="/views/activiti/flowfile.jsp"%>
							
							<%@ include file="/views/activiti/commentfill.jsp"%>
							<!--  -->
							<!-- 提交按钮 -->
							<div class="form-group margin-top-10">
								<div class="col-md-offset-5 col-md-4 row">
									<button class="demo-loading-btn btn blue" id="btn_save"
										data-loading-text="保存中..." type="button">保存</button>
									<button class="demo-loading-btn btn blue" id="btn_submit"
										data-loading-text="提交中..." type="button">提交</button>
									<button class="demo-loading-btn btn blue" id="btn_withdraw"
										data-loading-text="抽单中..." type="button">抽单</button>
									<button class="demo-loading-btn btn blue" id="btn_close"
										data-loading-text="关闭中..." type="button">关闭流程</button>
									<button type="button" class="btn default"
										onclick="history.go(-1)">取消</button>
								</div>
							</div>
							<!-- 提交按钮 -->
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
	<script src="${ctx }/assets/activiti/date.js"/>
 	<script src="${ctx }/assets/scripts/json_parse.js"></script>
 	<script type="text/javascript">
		jQuery(document).ready(function() {
			
			App.init(); // initlayout and core plugins
			
			inituser(null,null,null);  //npernr,appid,appda    加载申请用户信息
			initpositions(null,null,null);  //npernr,postid,appda  加载岗位列表
			initcomments(null); //proc_inst_id  加载批注列表
			initdraftcomment(null); //taskid   加载草稿批注
			
			  $('.demo-loading-btn')
		      .click(function () {  
		    	layer.load('请稍候...', 3);             
		        var btn = $(this)
				btn.attr({"disabled":"disabled"}) //解除click绑定，然后隐藏。.hide()
		        btn.button('loading')
		        setTimeout(function () {
		          btn.button('reset')
		        }, 3000)
		    })
		});
				
	</script> </content>
