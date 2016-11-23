<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
				<h3 class="page-title"></h3>-->
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
					<%--
					<ul class="nav nav-tabs">
						<li class="active"><a href="#"><lable class="fa fa-list"></lable>URL权限列表</a></li>
						<li><a href="${ctx }/permission/permission/add"><lable class="fa fa-file-text-o"></lable>新增URL权限</a></li>
					</ul>
					--%>

					
						
						<div class="profile-account"
							id="tab_1_1">
							<tags:message content="${message}" />
							<div>
								
								<div class="portlet-body form">

									
									<form id="searchForm" class="form-inline" action="${ctx }/agpay/agpay/search">
										<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
										<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
										<div class="row-fluid">

											<label>状态</label>
											<div class="form-group">
												<select id="zt" name="zt"
															class="form-control" placeholder="">
													<option value="">全部</option>
													<option value="draft" <c:if test="${zt eq 'draft'}">selected="selected"</c:if> >草稿</option>
													<option value="running" <c:if test="${zt eq 'running'}">selected="selected"</c:if> >审批中</option>
													<option value="finished" <c:if test="${zt eq 'finished'}">selected="selected"</c:if> >审批通过</option>
													<option value="void" <c:if test="${zt eq 'void'}">selected="selected"</c:if> >已作废</option>
												</select>
												<span class="help-block"></span>
												</div>
											<button type="submit" class="btn btn-default">查询</button>
										</div>
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
													<th>费用承担公司</th>
													<th>报销金额</th>
													<th>操作</th>
												</tr>
											</thead>
											<c:forEach items="${page.list}" var="agpay" varStatus="vstt" >
												<tr>
													<td>${vstt.index+1 }</td>
													<td><fmt:formatDate value='${agpay.appda }' pattern="yyyy-MM-dd" type="date" dateStyle="full" /></td>
													<td>${agpay.m_fnm }</td>
													<td>${agpay.m_fcompnm }</td>
													<td>${agpay.m_reqmoney }</td>

													<td>
														<a href="${ctx }/agpay/agpay/view/${agpay.id}"
														   onMouseOver="$(this).tooltip('show')"
														   data-toggle="tooltip" title="查看" data-placement="top">
															<li class="fa fa-eye"></li>
														</a> &nbsp;&nbsp;
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
