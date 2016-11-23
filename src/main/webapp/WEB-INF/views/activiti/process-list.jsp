<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

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
				<!--BEGIN TABS-->
				<div class="tabbable tabbable-custom tabbable-full-width">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#"><lable class="fa fa-list-alt"></lable>流程列表</a></li>
						<li><a href="${ctx }/activiti/process/add"><lable class="fa fa-list-alt"></lable>流程部署</a></li>
					</ul>
					
					<div class="tab-content">
						<tags:message content="${message}" />
							<div class="portlet-body form">
										<form id="searchForm" class="form-inline" action="${ctx }/activiti/process/list">
											<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
											<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
											
											<div class="row-fluid">
										
											<label>流程</label> 
											<div class="form-group">
												
										 		<select id="flow_key" name="flow_key" class="select2-container form-control select2me input-sm read  " style="width: 300px" placeholder="" >
													<option value="">请选择</option>
													<c:forEach items="${definitionList }" var="definition" varStatus="vstt">
														<option value="${definition.key }" <c:if test="${definition.key eq flow_key }"> selected="selected"</c:if>>${definition.key }-${definition.name }</option>
													</c:forEach>
												</select>
											</div>
											
												
											<button type="submit" class="btn btn-default">查询</button>
											
											<a class="btn btn-default" href="${ctx }/activiti/process/download/imagelist">下载所有流程图(最新版本)</a>
											<a class="btn btn-default" href="${ctx }/activiti/process/download/allversion/imagelist">下载所有流程图(所有版本)</a>
										</div>
										</form>
							</div>
							
							<div class="col-md-2" style="padding-left: 0px;">
						<div class="tab-content" >
							<div class="tab-pane active">
							<table id="treeTable" 
								class="table table-striped table-bordered table-advance table-hover table-condensed">
								<thead>
									<tr>
										<th>流程名称</th>
										<%--
										<th>版本号</th>
										<th>状态</th>
										<th>XML</th>
										<th>流程图</th>
										<th style="width:100px">操作</th>
										 --%>
									</tr>
								</thead>
								<c:forEach items="${definitionList}" var="process" varStatus="vstt">
									<tr>
										<td><a name="a_process_list" data-key="${process.key }" data-name="${process.name }" href="javascript:;">${process.key}-${process.name}-v${process.version}</a></td>
										<%--
										<td>${process.version}</td>
										<td>
										${process.suspended eq "false" ? "运行中" : "暂停" }
										<c:if test='${process.suspended eq "false" }'>
											<a href="${ctx }/activiti/suspend/${process.id}">暂停</a>
										</c:if>
										<c:if test='${process.suspended eq "true" }'>
											<a href="${ctx }/activiti/activate/${process.id}">启用</a>
										</c:if>
										</td>
										<td>
											<a target="_blank" href="resources/xml/${process.id}">查看XML</a>
										</td>
										<td>
											<a target="_blank" href="resources/image/${process.id}">流程图</a>
										</td>
										<td>
											<a href="${ctx }/activiti/process/download/image/${process.id}"
												onMouseOver="$(this).tooltip('show')"
												data-toggle="tooltip" title="下载流程图PNG" data-placement="top">
												<li class="fa fa-picture-o"></li>
											</a>
											&nbsp;&nbsp;
											<a href="${ctx }/activiti/process/download/xml/${process.id}"
												onMouseOver="$(this).tooltip('show')"
												data-toggle="tooltip" title="下载流程图XML" data-placement="top">
												<li class="fa fa-download"></li>
											</a>
											&nbsp;&nbsp;
											<a target="_blank" href="${ctx }/activiti/deployment/delete/${process.deploymentId}"
												onMouseOver="$(this).tooltip('show')"
												onclick="return confirm('确认要删除吗？', this.href)"
												data-toggle="tooltip" title="删除" data-placement="top">
												<li class="fa fa-trash-o"></li>
											</a>
										</td>
										--%>
									</tr>
								</c:forEach>
							</table>
                            </div>
                            <!-- <div class="dataTables_paginate paging_bootstrap">${processes}</div> -->
						</div>
						</div>
						<div id="" class="col-md-10" style="padding-left: 0px;">
								<div style="padding-left: 2px;">
									<label>选中流程:  </label> 
									<label id="lab_selprocess"></label>
									<input type="hidden" id="process_hidden" name="process_hidden" value=""/> 
								</div>
							<ul class="nav nav-tabs" style="padding-top: 5px;">
						        <li name="li_process_mgr" class="active">
						            <a id="a_process_info" name="a_process_mgr" data-src="${ctx }/activiti/process/info" href="javascript:;">  流程信息</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/flowrule/modelmgr" href="javascript:;">  规则实体类管理</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/flowrule/rulescene" href="javascript:;">  规则场景</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/flowrule/rulembr" href="javascript:;">  规则管理</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/flowrule/conditionmgr" href="javascript:;">  条件管理</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/approve/process/list" href="javascript:;">  审批组管理</a>
						        </li>
						       	<li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/message/template" href="javascript:;">  消息模板</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/message/msgcontrol" href="javascript:;">  消息控制</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/performance/urlswitch" href="javascript:;">  路径控制</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/grant/flowgrant/grant" href="javascript:;">  流程授权</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/permission/permission" href="javascript:;">  权限控制</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/jump/jump" href="javascript:;">  任务调转</a>
						        </li>
						        <li name="li_process_mgr">
						            <a name="a_process_mgr" data-src="${ctx }/sqlmgrs/sqlmgrs" href="javascript:;">  草稿申请SQL配置</a>
						        </li>
						    </ul>
							<div id="mainId">
								<iframe id="mainFrame" name="mainFrame" src="" frameborder="0"
									width="100%" height="720px"></iframe>
							</div>
						</div>
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
        
        $("[name='a_process_list']").click(function(){
        	var key = $(this).data('key');
        	var name = $(this).data('name');
        	$("#lab_selprocess").empty();
        	$("#lab_selprocess").append(key + '-' + name);
        	
        	$("#process_hidden").val(key);
        	
        	$("#a_process_info").triggerHandler("click");
        });
        
        $("[name='a_process_mgr']").click(function(){
        	var src = $(this).data("src");
        	$("#mainFrame").attr("src", src + "?flow_key=" + $("#process_hidden").val() + "&proc_def_key=" + $("#process_hidden").val());
        	
        	$("[name='li_process_mgr']").removeClass("active");
        	$(this).parent("li").addClass("active");
        });
        
    });
    function page(n,s){
        $("#pageNo").val(n);
        $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }
</script>
</content>