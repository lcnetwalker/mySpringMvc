<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	
	<meta name="decorator" content="default3" />

</head>
<body>
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB
				<h3 class="page-title">
					岗位企业人事结构
				</h3>
				${breadcrumb }-->
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>
		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->
		<div class="row-fluid profile">
			<div class="span12">
				<!--BEGIN TABS-->
				<div class="tabbable tabbable-custom tabbable-full-width">
				<!-- 	<ul class="nav nav-tabs">
						<c:if test='${flag eq "view"}'>
							<li><a href="${ctx}/positions/postinforlist/personnelstructure?objid=${hrp1000.objid}&check=check"><lable class="fa fa-list"></lable>岗位企业人事结构列表</a></li>
						</c:if>
						<c:if test='${flag ne "view"}'>
							<li><a href="${ctx}/positions/postinforlist/personnelstructure?objid=${hrp1000.objid}&check=checkedit"><lable class="fa fa-list"></lable>岗位企业人事结构列表</a></li>
						</c:if>
						<li class="active"><a href="#"><lable class="fa fa-file-text-o"></lable>${("edit" eq flag)?'修改':("copy" eq flag ?'复制':("bound" eq flag?'定界':("view" eq flag?'查看':'新增')))}岗位企业人事结构</a></li>
					</ul> -->
					
						<div class="profile-account">
							
							<div class="col-md-12">
								<div class="tab-content">
									<div class="tab-pane active">
									<div class="margin-top-8">
										<!-- BEGIN FORM-->
											<div class="form-body">
												<div class="form-group">
													<!-- <label  class="col-md-4 control-label">选择</label> -->
													<div class="col-md-8">
														<input type="text" id="sys_personposition" name="sys_personposition" class="form-control" 
															placeholder="请点击选择人员" value="${defaultPostId}"  >
														
														<!-- <span class="help-block">必填项.</span> -->
													</div>
												</div>
												<%--
												<div class="form-group">
													<div class="col-md-8">
														<textarea id="sys_personmessage" name="sys_personmessage" class="form-control" 
															placeholder="请填写意见" rows="8"></textarea>
														
														<!-- <span class="help-block">必填项.</span> -->
													</div>
												</div>
												 --%>
											</div>
											
										<!-- END FORM--> 
										</div>
									</div>
								</div>
							</div>
							<!--end col-md-9-->
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
<content tag="myJavascript">
	<script src="${ctx}/static/assets/scripts/myString.js" type="text/javascript" ></script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			App.init(); // initlayout and core plugins
			
			
			$("#sys_personposition").select2({
				placeholder: "",
				
		        //minimumInputLength: 0,
		        multiple: false,
		        ajax: {
		            url: '/activiti/flowpage/json/findPersonAndPosition',
		            dataType: 'json',
		            data: function(term, page) {

		                return {
		                	q : term,
		                	page_limit: 10, // page size
		                    page: page, 
		                };
		            },
		           
		            results: function(data, page) {
		            	
		            	var more = (page * 10) < data.total;
		                return {
		                	results: data.list, more: more
		                };
		            }
		        },
		        id: function(object) {
		        	
		        	return object.objid;
		        },
		        formatResult: formatResult,
		        formatSelection: formatSelection,
	 	        initSelection: function(element, callback) {
	 	        	var postid=$(element).val();
	 	        	if(postid != null && postid != '') {
	 	        		$.ajax("/activiti/flowpage/json/findPersonAndPositionItem", {
	 		                data: {
	 		                	postid: postid
	 		                },
	 		                dataType: "json"
	 		            }).done(function(data) { callback(data.person); });
			        	
	 	        	}
		        	
	 	        }
		        //dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
		        //escapeMarkup: function (m) { return m; } 
			});
			
			function formatResult(node) {
			    return  node.login_name + '-' + node.nachn + "-" + node.stext;
			};

			function formatSelection(node) {
			    return node.login_name + '-' + node.nachn + "-" + node.stext;
			};
            
		});
		
	</script>
</content>