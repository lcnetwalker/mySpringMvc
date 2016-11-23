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
						<li class="active"><a href="#"> <lable class="fa fa-retweet"></lable>运行中费用列表</a></li>
					</ul>

					<form id="searchForm" class="form-inline" action="/agpay/agpay/runninglist" method="get">
						<input id="pageNo" name="pageNo" type="hidden" value="1">
						<input id="pageSize" name="pageSize" type="hidden" value="10">
						<div class="row-fluid">
							<div class="form-group">

								<label>成本中心</label>
								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="ysxx_cbzx" id="ysxx_cbzx">
										</select>
										<input id="ysxx_cbzx_d" name="ysxx_cbzx_d" type="hidden" value="${map.ysxx_cbzx}"/>
									</div>
								</div>
								<label>成本中心组 </label>
								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="ysxx_cbzx_group" id="ysxx_cbzx_group" >
										</select>
										<input id="ysxx_cbzx_group_d" name="ysxx_cbzx_group_d" type="hidden" value="${map.ysxx_cbzx_group}"/>
									</div>
								</div>

								<label>科目编码 </label>

								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="ysxx_kjkmbh" id="ysxx_kjkmbh" >
										</select>
										<input id="ysxx_kjkmbh_d" name="ysxx_kjkmbh_d" type="hidden" value="${map.ysxx_kjkmbh}"/>
									</div>
								</div>

							</div>
							<div class="form-group">
								<label>科目预算组 </label>

								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="ysxx_kjkmbh_group" id="ysxx_kjkmbh_group" >
										</select>
										<input id="ysxx_kjkmbh_group_d" name="ysxx_kjkmbh_group_d" type="hidden" value="${map.ysxx_kjkmbh_group}"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>公司</label>
								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="ysxx_bukrs" id="ysxx_bukrs" >
										</select>
										<input id="ysxx_bukrs_d" name="ysxx_bukrs_d" type="hidden" value="${map.ysxx_bukrs}"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>流程环节</label>

								<div class="form-group">
									<div class="input-group input-medium ">
										<select class="select2-container form-control select2me input-sm" name="flow_parts" id="flow_parts" >
											<option value="" >请选择</option>
											<option value="accout" <c:if test="${map.flow_parts eq 'accout' }">selected="selected" </c:if> >财务会计审核</option>
											<option value="accoutmanger" <c:if test="${map.flow_parts eq 'accoutmanger' }">selected="selected" </c:if>>财务部门内部审核</option>
											<option value="payment" <c:if test="${map.flow_parts eq 'payment' }">selected="selected" </c:if>>出纳审核</option>
										</select>
										<input id="flow_parts_d" name="flow_parts_d" type="hidden" value="${map.flow_parts}"/>
									</div>
								</div>
								
							</div>
							<div class="form-group">
								<button>查询</button>
							</div>
						</div>
					</form>
						
						<div class="profile-account"
							id="tab_1_1">
							<%--<jsp:include page="/views/agpay/taskmenu_my.jsp?menu=4"></jsp:include>--%>
							<tags:message content="${message}" />
							<div>
								
								<div class="portlet-body form">
									
									
									<form id="searchForm" class="form-inline" action="${ctx }/agpay/agpay/draftlist" method="get">
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
														<c:if test="${empty agpay.proc_inst_id }">
															<a href="${ctx }/agpay/agpay/edit/${agpay.id}"
																onMouseOver="$(this).tooltip('show')"
																data-toggle="tooltip" title="修改" data-placement="top">
																<li class="fa fa-pencil"></li>
															</a> &nbsp;&nbsp; 
															<a href="${ctx }/agpay/agpay/view/${agpay.id}"
																onMouseOver="$(this).tooltip('show')"
																data-toggle="tooltip" title="查看" data-placement="top">
																<li class="fa fa-eye"></li>
															</a> &nbsp;&nbsp;
															<a href="${ctx }/agpay/agpay/delete/${agpay.id}"
																onMouseOver="$(this).tooltip('show')"
																onclick="return confirm('确认要删除该条信息吗？', this.href)"
																data-toggle="tooltip" title="删除" data-placement="top">
																<li class="fa fa-trash-o"></li></a>
																 &nbsp;&nbsp;
														</c:if>
														<c:if test="${not empty agpay.proc_inst_id }">
															<a href="${ctx }/agpay/agpay/view/${agpay.id}"
																onMouseOver="$(this).tooltip('show')"
																data-toggle="tooltip" title="查看" data-placement="top">
																<li class="fa fa-eye"></li>
															</a> &nbsp;&nbsp;
														</c:if>
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

		getBukrsByPostid();
		getcompany();
		getkmbm();
    });
    function page(n,s){
        $("#pageNo").val(n);
        $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }

	//加载成本中心列表
	function getBukrsByPostid(postid,appda){
		$.getJSON("${ctx}/agpay/agpay/json/getCbzx",
				{postid:postid,appda:appda},function(data){


					if(typeof data.kotls != 'undefined'){
						var msg = "<option value=''>请选择</option>";
						$.each(data.kotls,function(i,item){
							msg += "<option value='"  +  item.kostl +  "'>" + item.kostl + "-" + item.ktext + "</option>";
						});
						$("select#ysxx_cbzx").html(msg);
						if($("#ysxx_cbzx_d").val()!=""){
							$("select#ysxx_cbzx").select2('val',$("#ysxx_cbzx_d").val());
						}

					}

				});
	}

	//加载费用承担公司列表
	function getcompany() {

		$.getJSON("${ctx}/agpay/agpay/json/companylist", {
				},
				function (data) {
					var str = "<option value=''>请选择</optioin>";
					$.each(data.companylist, function (index, item) {
						str += "<option value ='" + item.bukrs + "'>" + item.bukrs + "-" + item.butxt + "</option>";
					});
					$("#m_fcompid").empty();
					$("#ysxx_bukrs").append(str);
					if ($("#ysxx_bukrs_d").val() != "") {

						$("#ysxx_bukrs").select2("val", $("#ysxx_bukrs_d").val());
					} else {
						$("#ysxx_bukrs").select2("val", "");
					}
				});

	}

	//加载科目编码
	function getkmbm() {

		$.getJSON("${ctx}/agpay/agpay/json/getKmbm", {
				},
				function (data) {
					var str = "<option value=''>请选择</optioin>";

					$.each(data.kmbms, function (index, item) {
						str += "<option value ='" + index + "'>" + index + "-" + item + "</option>";
					});
					$("#ysxx_kjkmbh").empty();
					$("#ysxx_kjkmbh").append(str);
					if ($("#ysxx_kjkmbh_d").val() != "") {

						$("#ysxx_kjkmbh").select2("val", $("#ysxx_kjkmbh_d").val());
					} else {
						$("#ysxx_kjkmbh").select2("val", "");
					}
				});

	}

</script>
</content>
