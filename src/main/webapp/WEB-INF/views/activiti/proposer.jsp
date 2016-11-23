<%@ page import="com.gmk.framework.common.utils.UserUtils" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 基本信息类型一 模块内容1 -->
<div class="portlet box">
	<!-- 
	<div class="portlet-title">
		<div class="caption">
			 <li class="fa fa-user"></li>申请人基本信息
		</div>
		<div class="tools">
			<a class="collapse" href="javascript:;"></a>
		</div>
	</div>
	 -->
	<div class="portlet-body" style="">
		<div class=" form-body form-horizontal">
			<div class="form-group">
				
				<label class="col-md-2 control-label">申请单号</label>
				<div class="col-md-4">
					<input type="text" id="appid" name="appid"
						class="form-control " value="" readonly>
				</div>	
				
				<label class="col-md-2 control-label">申请日期</label>
				<div class="col-md-4">
					<input type="text" id="appda" name="appda"
						class="form-control " value="" readonly>
				</div>
			</div>
			<div class="form-group">
				
				<label class="col-md-2 control-label">申请人姓名</label>
				<div class="col-md-4">
					<div class="input-group">
						<input type="text" id="username_pernr"
						   class="form-control " value="" readonly>
						<span class="input-group-addon" id="span_username_pernr"><i class="fa fa-user"></i></span>
					</div>
				</div>
				
				<label class="col-md-2 control-label">所属部门</label>
				<div class="col-md-4">
					<input type="text" id="business_dept"
						class="form-control " value="" readonly/>
				</div>
			</div>
			
			
			<input type="hidden" id="userid" name="userid"
						class="form-control " value="" readonly>
			<input type="hidden" id="username" name="username"
				class="form-control " value="" readonly>
			<input type="hidden" id="pernr" name="pernr"
						class="form-control " value="" readonly>
									
			<input type="hidden" id="syspostname" name="syspostname"/>
			<input type="hidden" id="sysdeptid" name="sysdeptid"/>
			<input type="hidden" id="sysdeptname" name="sysdeptname"
						class="form-control " value="" readonly/>
			<input type="hidden" id="sysbusinessunitid" name="sysbusinessunitid"/>
			<input type="hidden" id="sysbusinessunitname" name="sysbusinessunitname"/>
			
			<input type="hidden" id="sys_proposer_init" value=""/>
			
			<input type="hidden" id="syspreviousurlpath" name="syspreviousurlpath" value='<%=request.getHeader("Referer") != null ? request.getHeader("Referer") : ""%>'/>

			<!-- 当前用户itcode -->
			<input type="hidden" id="syscurrentuserid" value="<%=UserUtils.getUser().getLoginName() %>"/>
		</div>
	</div>
</div>
<!-- end 模块内容 -->
<script src="${ctx}/static/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>

<script type="text/javascript">
	
	jQuery(document).ready(function(){
		function sysinitdept(postid,appda) {
			$.getJSON("/activiti/flowpage/jsondeptinit", {
				postid: postid,
				appda: appda
			}, function(data){
				$("#sys_proposer_init").val("complete");
				
				var position=data.position;
				var organization=data.organization;
				var businessunit=data.businessunit;
				
				if(typeof position != 'undefined') {
					$("#syspostname").val(position.stext);
				}
				else {
					$("#syspostname").val('');
				}
				if(typeof organization != 'undefined') {
					$("#sysdeptid").val(organization.objid);
					$("#sysdeptname").val(organization.stext);
				}
				else {
					$("#sysdeptid").val('');
					$("#sysdeptname").val('');
				}
				if(typeof businessunit != 'undefined') {
					$("#sysbusinessunitid").val(businessunit.objid);
					$("#sysbusinessunitname").val(businessunit.stext);
				}
				else {
					$("#sysbusinessunitid").val('');
					$("#sysbusinessunitname").val('');
				}
				
				$("#business_dept").val($("#sysbusinessunitname").val()+"-"+$("#sysdeptname").val());
			});
		}
		
		$(document).live("syspositioninit", function(event, postid, appda){
			sysinitdept(postid, appda);
		});
		
		$(document).live("syspositionchange", function(event,postid, appda){
			sysinitdept(postid, appda);
		});
		
		$("#span_username_pernr").click(function(){
			var uid = $("#userid").val();
			if(uid != "") {
				$.jBox.open("iframe:${ctx}/activiti/flowpage/userinfo/"+uid, "申请人信息", 600, 500, {
						buttons: {
							"关闭":true
						},
						submit:function(v, h, f){
							//if (v=="ok"){
								
							//}
						}
				});
			}
		});
	});
	

	function inituser(pernr,appid,appda) {
		jQuery.getJSON("/activiti/flowpage/jsonproposer", {
			pernr:pernr,
			appda:appda
		}, function(data){
			//var d = json_parse(data);
			$("#userid").val(data.userid);
			$("#username").val(data.username);
			$("#pernr").val(data.pernr);
			
			$("#username_pernr").val(data.pernr+'-'+data.username);
			
			if(appid!=null&&appid!="") {
				$("#appid").val(appid);
			}
			
			if(appda!=null&&appda!="") {
				
				$("#appda").val(appda.substr(0,10));
			}
			else {
				$("#appda").val(data.appda);
			}
			
			$(document).trigger("proposerinit", [data.userid,data.pernr,appid,$("#appda").val()]);
		});
		
		
	}

	function syscheckuser() {
		var rb = false;
		jQuery.ajax( {
			url:'${ctx}/activiti/flowpage/jsoncurrentUserid',
			type:'GET',
			cache:false,
			async:false,  //同步请求
			//dataType:'json',
			success:function(data) {
				if(data == $("#syscurrentuserid").val()) {
					rb = true;
				}
			},
			error : function() {
				alert("服务器异常!");
			}
		});
		return rb;
	}

</script>