<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<%@ page import="com.gmk.framework.common.utils.Page" %>
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
				<!-- BEGIN PAGE TITLE & BREADCRUMB
				<h3 class="page-title">任务列表</h3>-->
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
						<li><a href="${ctx }/activiti/flowpage/oaform-dqx"><lable class="fa fa-list-alt"></lable>申请表单</a></li>
						<li class="active"><a href="#"> <lable class="fa fa-retweet"></lable>任务列表</a></li>
					</ul>

					
						
						<div class="profile-account"
							id="tab_1_1">
							<jsp:include page="/views/activiti/taskmenu.jsp?menu=1"></jsp:include>
							<tags:message content="${message}" />
							<div>
								
								<div class="portlet-body form">
									
									
									<form id="searchForm" class="form-inline" action="#">
										<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
										<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			
									</form>
									 
								</div>
								
							</div>
							
							<div >
								<div class="tab-content">
									<div class="tab-pane active">
										<table id="treeTable"
											class="table table-striped table-bordered table-advance table-hover table-condensed">
											<thead>
												<tr>
													<th>序号</th>
													<th>申请人名称</th>
													<th>任务名称</th>
													<th>操作</th>
												</tr>
											</thead>
											<c:forEach items="${page.list}" var="taskitem" varStatus="vstt" >
												<tr>
													<td>${vstt.index+1 }</td>
													<td></td>
													<td></td>
													<td>
														
													</td>
													
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<div class="dataTables_paginate paging_bootstrap pagination">${page}</div>
							</div>
							
						</div>

					</div>
					
			</div>
		</div>

	</div>
</body>
</html>
<content tag="myJavascript">
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init(); // initlayout and core plugins
    });
    function page(n,s){
        $("#pageNo").val(n);
        $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }
</script>
</content>
