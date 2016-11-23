<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<link href="${ctx}/static/assets/css/profile.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/assets/js/qtip/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
<meta name="decorator" content="default" />
</head>
<body>
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
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
						<li><a id="a_processlog" href="${ctx }/activiti/trace/list/${processInstance.processInstanceId}">流转日志</a></li>
						<li class="active"><a href="#">流程图跟踪</a></li>
					</ul>
					
					<div class="tab-content">
						<tags:message content="${message}" />
						<div class="tab-content">
							<div class="tab-pane active">
								
								<div id="traceImage">
									<iframe id="iframe1" class="col-md-12" heigth="100%" style="height: 800px" frameborder="0"  scrolling="auto" 
										src="${ctx }/diagram-viewer/index.jsp?processDefinitionId=${processInstance.processDefinitionId }&processInstanceId=${processInstance.processInstanceId}"></iframe>
								</div>
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
        if(backurl != "") {
        	$("#li_back").show();
        	$("#a_back").attr("href", backurl);
        	$("#a_processlog").attr("href", $("#a_processlog").attr("href") + "?backurl=" + backurl);
        }
        
        
    });
    
</script>
</content>