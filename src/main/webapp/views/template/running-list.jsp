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
						<li><a href="${ctx }/agpay/agpay"><lable class="fa fa-list-alt"></lable>新凤祥代办报账申请</a></li>
						<li class="active"><a href="#"> <lable class="fa fa-retweet"></lable>我的申请</a></li>
					</ul>

					
						
						<div class="profile-account"
							id="tab_1_1">
							<jsp:include page="/views/agpay/taskmenu_my.jsp?menu=2"></jsp:include>
							<tags:message content="${message}" />
							<div>
								
								<div class="portlet-body form">
									
									
									<form id="searchForm" class="form-inline" action="${ctx }/agpay/agpay/runningtasklist" method="get">
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
												<th>申请日期</th>
												<th>交办人</th>
												<th>交办岗位</th>
												<th>报销金额</th>
												<th>操作</th>
											</tr>
											</thead>
											<c:forEach items="${page.list}" var="agpay" varStatus="vstt" >
												<tr>
													<td>${vstt.index+1 }</td>
													<td><fmt:formatDate value='${agpay.appda }' pattern="yyyy-MM-dd" type="date" dateStyle="full" /></td>
													<td>${agpay.m_fnm }</td>
													<td>${agpay.m_fpostnm }</td>
													<td>${agpay.m_reqmoney }</td>
													<td>
														<a href="${ctx }/activiti/trace/list/${agpay.proc_inst_id}">${agpay.name_ }(
															<c:if test="${empty agpay.assignee_ }">
																未签收
															</c:if>
															<c:if test="${not empty agpay.assignee_ }">
																${agpay.taskusername }
															</c:if>)</a>
													</td>
													<td>
														<a href="${ctx }/agpay/agpay/view/${agpay.id}"
															onMouseOver="$(this).tooltip('show')"
															data-toggle="tooltip" title="查看" data-placement="top">
															<li class="fa fa-eye"></li>
														</a> &nbsp;&nbsp;
														<%-- <a href="${ctx}/agpay/agpay/drop/${agpay.proc_inst_id}">删除</a> --%>
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
