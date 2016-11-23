<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
						<li id="li_back" style="display:none"><a id="a_back" href="#">返回</a></li>
						<li class="active"><a href="javascript:;">流转日志</a></li>
						<li><a id="a_processtrace" href="${ctx }/activiti/trace/image/${processInstanceId}">流程图跟踪</a></li>
					</ul>
					
					<div class="tab-content">
						<tags:message content="${message}" />
								
						<div class="tab-content">
							<div class="tab-pane active">
							<table id="treeTable"
								class="table table-striped table-bordered table-advance table-hover table-condensed">
								<thead>
									<tr>
										<th>环节名称</th>
										<th>办理人</th>
										<th>任务创建时间</th>
										<th>任务签收时间</th>
										<th>任务完成时间</th>
									</tr>
								</thead>
								<c:forEach items="${tasks}" var="task">
									<tr>
										<td>${task.name}</td>
										<td>${users[task.assignee]}</td>
										<td><fmt:formatDate value='${task.startTime}' pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="full" /></td>
										<td><fmt:formatDate value='${task.claimTime}' pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="full" /></td>
										<td>
										<c:if test="${not empty task.endTime }">
										<fmt:formatDate value='${task.endTime}' pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="full" />
										</c:if>
										<c:if test="${empty task.endTime }">
										正在办理
										</c:if>
										</td>
									</tr>
									<c:if test="${not empty taskComments[task.id] }">
									<tr>
										<td colspan="6" style="padding-left: 2em;">
											<table id="treeTable"
								class="table table-striped table-bordered table-advance table-hover table-condensed">
												<thead>
													<tr>
														<th>处理人</th>
														<th>审批类型</th>
														<th>审批时间</th>
														<th>审批意见</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${taskComments[task.id] }" var="comment">
													<tr>
														
														<td>${users[comment.userId] }</td>
														<td>${types[comment.type] }<c:if test="${not empty delegateTypes[comment.id] }">(${delegateTypes[comment.id] })</c:if></td>
														<td><fmt:formatDate value='${comment.time}' pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="full" /></td>
														<td>${comment.fullMessage }</td>
													</tr>
													</c:forEach>													
												</tbody>
											</table>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</table>
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
        var backurl = "${backurl}";
    	if(backurl == "") {
    		backurl = document.referrer;
    	}
    	
        if(backurl != null && backurl != "") {
        	
        	$("#li_back").show();
        	$("#a_back").attr("href", backurl);
        	$("#a_processtrace").attr("href", $("#a_processtrace").attr("href") + "?backurl=" + backurl);
        }
    });
    function page(n,s){
        $("#pageNo").val(n);
        $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }
</script>
</content>