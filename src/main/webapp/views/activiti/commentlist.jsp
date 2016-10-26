<%@ page contentType="text/html;charset=UTF-8"%>
<head>
<title>意见选择</title>
<link href="${ctx}/assets/jquery-jbox/2.3.1/jBox/Skins/Blue/jbox.css" rel="stylesheet">
 <style type="text/css">

.table-condensed tr:hover {
	background-color: #efefef;
	cursor:pointer;
}

.table-condensed tr.active1 {
	background-color:  #efefef;
	color: #0070c0;
}
 
 </style>
</head>

<!-- 流转意见一 模块内容1 -->
<div class="portlet box">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-align-justify"></i>审批记录
		</div>
		<div class="tools">
			<a class="expand" href="javascript:;"></a>
		</div>
	</div>
	<div class="portlet-body" style="display: none;">
	<div class="form-body form-horizontal">
		<div class="row">
	   <div class="col-md-12">
		<div id="div_currentActivity">
		<label id="l_currentActivity"></label>
		</div>
		
		<table id="comment_table"
			class="table table-striped table-bordered table-advance table-hover table-condensed">
			<thead>
				<tr>
					<th style="width:120px">处理人</th>
					<th>岗位</th>
					<th>审批环节</th>
					<th>审批类型</th>
					<th>审批时间</th>
					<th style="width: 40%">审批意见</th>
				</tr>
			</thead>
			<tbody id="comment_tbody">
				<%--
				<c:forEach items="${comments}" var="comment" varStatus="vstt" >
					<tr>
						<td>${types[comment.type] }</td>
						<td>${tasknames[comment.taskId] }</td>
						<td>${comment.message }</td>
						<td>${usernames[comment.userId] }</td>
						<td>${comment.userId }</td>
						
					</tr>
				</c:forEach>
 				--%>
			</tbody>
		</table>
		</div>
		</div>
		</div>
	</div>
</div>
<!-- end 模块内容 流转意见 -->

<script type="text/javascript">
	function initcomments(proc_inst_id,postid,appda) {
		if(proc_inst_id != null && proc_inst_id != "") {
			jQuery.getJSON("/activiti/flowpage/jsoncommentlist", {
				proc_inst_id: proc_inst_id,
				postid : postid,
				appda : appda
			}, function(data){
				//var d = json_parse(data);
				var usernames=data.usernames;
				var tasknames=data.tasknames;
				var positions=data.positions;
				var types=data.types;
				var signPositions=data.signPositions;
				var delegateTypes=data.delegateTypes;
				var cstr = "";
				jQuery.each(data.comments, function(index, item){
					cstr += "<tr>";
					if(item.userId != null && item.userId != "") {
						cstr += "<td>"+usernames[item.userId];
						if(typeof delegateTypes[item.id] != "undefined") {
							cstr += "("+delegateTypes[item.id]+")";
						}
						cstr += "</td>";
					}
					else {
						cstr += "<td></td>";
					}
					
					if(typeof signPositions[item.id] != "undefined") {
						cstr += "<td>"+signPositions[item.id]+"</td>";
					}
					else {
						cstr += "<td>"+positions[item.taskId]+"</td>";
					}
					
					cstr += "<td>"+tasknames[item.taskId]+"</td>";
					cstr += "<td>"+types[item.type];
					//if(typeof delegateTypes[item.id] != "undefined") {
					//	cstr += "("+delegateTypes[item.id]+")";
					//}
					cstr += "</td>";
					cstr += "<td>" +new Date(item.time).pattern("yyyy-MM-dd HH:mm:ss")+ "</td>";
					cstr += "<td>" +item.fullMessage+ "</td>";
					cstr += "</tr>";
				});
				jQuery("#comment_tbody").append(cstr);
			});
			
			jQuery.getJSON("/activiti/flowpage/jsontasklist", {
				proc_inst_id: proc_inst_id
			}, function(data){
				var taskIdList=data.taskIdList;
				var jobIdList=data.jobIdList;
				
				var taskNames=data.taskNames;
				var assignees=data.assignees;
				var taskDefinitionKeys=data.taskDefinitionKeys;
				var jointlySignTasks=data.jointlySignTasks;
				var isEnd = data.isEnd;
				
				var jobNames=data.jobNames;
				var jobDates=data.jobDates;
				
				var str = "";
				if((taskIdList != null && taskIdList.length > 0)
						|| (jobIdList != null && jobIdList.length > 0)) {
					str += "<a href='/activiti/trace/list/"+proc_inst_id+"'>当前节点:";
					if(taskIdList != null && taskIdList.length > 0) {
						jQuery.each(taskIdList, function(index, item){
							var taskDefinitionKey = taskDefinitionKeys[item];
							if(jointlySignTasks != null && jointlySignTasks.indexOf(taskDefinitionKey) != -1) {
								if(index == 0) {
									str += taskNames[item] + "[会签]";
									str += "(";
								}
								str += assignees[item] + ";";
								
								if(index == taskIdList.length - 1) {
									str += ")";
								}
							}
							else {
								str += taskNames[item] + "(" + assignees[item] + ")";
							}
						});
					}
					if(jobIdList != null && jobIdList.length > 0) {
						jQuery.each(jobIdList, function(index, item){
							var jobName = jobNames[item];
							var jobDate = jobDates[item];
							if(jobName != null && jobName != '' && jobName != 'undefined') {
								str += jobName;
							}
							if(jobDate != null && jobDate != '' && jobDate != 'undefined') {
								str += "(触发时间:" + jobDate + ")";
							}
						});
					}
					str += "</a>"
					$("#l_currentActivity").append(str);
				}
				else {
					if(isEnd == true) {
						$("#l_currentActivity").append("<a href='/activiti/trace/list/"+proc_inst_id+"'>状态: 流程已结束审批</a>");
					}
					else {
						$("#div_currentActivity").hide();
					}
					
				}
				
			});
		}
	}
	
	
</script>