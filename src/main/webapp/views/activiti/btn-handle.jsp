<%@ page contentType="text/html;charset=UTF-8"%>

<div class="form-group margin-top-10">
	<div class="col-md-offset-3 col-md-6 row">
		<input type="hidden" id="issignplushandle" name="issignplushandle" value="false"/>
		<button class="demo-loading-btn btn blue" id="btn_handle_save" style="display: none;"
			data-loading-text="保存中..." type="button">保存</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_submit" style="display: none;"
			data-loading-text="提交中..." type="button">提交</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_back" style="display: none;"
			data-loading-text="退回中..." type="button">退回</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_signplus" style="display: none;"
			data-loading-text="加签中..." type="button">加签</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_delegate" style="display: none;"
			data-loading-text="转办中..." type="button">转办</button>	
		<button class="demo-loading-btn btn blue" id="btn_handle_suspend" style="display: none;"
			data-loading-text="暂停中..." type="button">暂停</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_activate" style="display: none;"
			data-loading-text="启用中..." type="button">启用</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_void" style="display: none;"
			data-loading-text="作废中..." type="button">作废</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_claim" style="display: none;"
			data-loading-text="签收中..." type="button">签收</button>		
		<button class="demo-loading-btn btn blue" id="btn_reportprint" style="display: none;"
			data-loading-text="打印中..." type="button">打印</button>
		<button type="button" class="btn default"
			onclick="history.go(-1)">取消</button>
	</div>
</div>
<script type="text/javascript">
	function initializeButton(btnAU) {
		if(typeof btnAU.formPrintUrl != 'undefined') {
			if(btnAU.formPrintUrl != null && btnAU.formPrintUrl != '') {
				$("#btn_reportprint").show();
			}
		}
		
		if(typeof btnAU.taskid != "undefined") {
			if(btnAU.taskid != "") {
				$.getJSON("${ctx}/activiti/flowpage/jsonishandleauthority", {
					taskid: btnAU.taskid
				}, function(data) {
					if(data.suspensionState==1) {  
						//启用
						if(data.isOwner || data.isAssignee) {
							if(data.issignning) {  //false：加签 true:非加签
								//非加签
								if(data.isDelegate) {
									//发送过转办
									if(data.isDelegateTo) {
										//只有被转办人才能操作
										if(btnAU.formHandleSaveUrl != "") {
											$("#btn_handle_save").show();
										}
										if(btnAU.formHandleSubmitUrl != "") {
											$("#btn_handle_submit").show();
										}
										if(btnAU.formHandleBackUrl != "") {
											$("#btn_handle_back").show();
										}
										//转办
										if(data.determine == 0) { //assignee或owner为岗位的节点才能转办
											$("#btn_handle_delegate").show();
										}
										
										if(data.isMulti && data.isJoinlySign) { //多实例节点 且非会签节点
											$("#btn_handle_signplus").show();
										}
										
										//暂时先隐藏
// 										$("#btn_handle_suspend").show();
// 										$("#btn_handle_activate").hide();
 										if(typeof btnAU.isusevoid == "undefined" || btnAU.isusevoid == true) {
 											$("#btn_handle_void").show();  //作废按钮
 										}
									}
									
								}
								else {
									//未发送过转办
									if(btnAU.formHandleSaveUrl != "") {
										$("#btn_handle_save").show();
									}
									if(btnAU.formHandleSubmitUrl != "") {
										$("#btn_handle_submit").show();
									}
									if(btnAU.formHandleBackUrl != "") {
										$("#btn_handle_back").show();
									}
									//转办
									if(data.determine == 0) { //assignee或owner为岗位的节点才能转办
										$("#btn_handle_delegate").show();
									}
									
									if(data.isMulti && data.isJoinlySign) { //多实例节点 且非会签节点
										$("#btn_handle_signplus").show();
									}
									
									//暂时先隐藏
// 									$("#btn_handle_suspend").show();
// 									$("#btn_handle_activate").hide();
 									if(typeof btnAU.isusevoid == "undefined" || btnAU.isusevoid == true) {
 										$("#btn_handle_void").show();  //作废按钮
 									}
 									
								}
								
							}
							else {
								//加签
								if(data.isAssignee && btnAU.formHandleSubmitUrl != "") {
									//加签时，只有办理人才能提交
									$("#issignplushandle").val("true");
									$("#btn_handle_submit").show();
								}
							}
						}
						
						if(data.isCandidate) {
							$("#btn_handle_claim").show();
						}
						else {
							$("#btn_handle_claim").hide();
						}
					}
					else if(data.suspensionState==2){ //暂停
						$("#btn_handle_save").hide();
						$("#btn_handle_submit").hide();
						$("#btn_handle_back").hide();
						$("#btn_handle_delegate").hide();
						$("#btn_handle_signplus").hide();
						
						//暂时先隐藏
// 						$("#btn_handle_suspend").hide();
// 						$("#btn_handle_activate").show();
 						$("#btn_handle_void").hide();  //作废按钮
					}
					else if(data.suspensionState==3){ //作废
						$("#btn_handle_save").hide();
						$("#btn_handle_submit").hide();
						$("#btn_handle_back").hide();
						$("#btn_handle_delegate").hide();
						$("#btn_handle_signplus").hide();
						
						//暂时先隐藏
// 						$("#btn_handle_suspend").hide();
// 						$("#btn_handle_activate").hide();
 						$("#btn_handle_void").hide();  //作废按钮
					}
					
				});
				
				
			}
		}
	}

	function initBtnHandle(btnAU) {
		
		$(document).ajaxComplete(function(event, xhr, options){
			if(options.url.indexOf("/activiti/flowpage/jsonishandleauthority") != 0) {
				var proposerinit = false;
				var positionselinit = false;
				var flowfileinit = false;
				if(typeof $("#sys_proposer_init") != "undefined"
					&& $("#sys_proposer_init").length != 0) {
					if($("#sys_proposer_init").val()=="complete") {
						proposerinit=true;
					}
				}
				else {
					proposerinit=true;
				}
				if(typeof $("#sys_positionsel_init") != "undefined"
					&& $("#sys_positionsel_init").length != 0) {
					if($("#sys_positionsel_init").val()=="complete") {
						positionselinit = true;
					}
					
				}
				else {
					positionselinit = true;
				}
				if(typeof $("#sys_flowfile_init") != "undefined"
					&& $("#sys_flowfile_init").length != 0) {
					if($("#sys_flowfile_init").val() == "complete") {
						flowfileinit = true;
					}
				}
				else {
					flowfileinit = true;
				}
				if(proposerinit && positionselinit && flowfileinit) {
					
					initializeButton(btnAU);
				}
			}
			
		});
		

		$("#btn_handle_save").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'savehandle';
			if(typeof btnAU.formHandleSaveFunc == 'function') {
				var rf = btnAU.formHandleSaveFunc();
				if(!rf) {
					return;
				}
			}
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formHandleSaveUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formHandleSaveUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_handle_submit").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

// 			zt = 'handle';
			if(typeof btnAU.formHandleSubmitFunc == 'function') {
				var rf = btnAU.formHandleSubmitFunc();
				if(!rf) {
					return;
				}
			}
			
			$("#v_B_isagree").val('true');
			if($("#issignplushandle").val()=="true") { //加签人办理
				var omsg = "";
				if($("#comment").length>0) {
					omsg = $("#comment").val();
				}
				if(omsg == null || omsg.trim() == "") {
					alert("必须填写意见");
					return ;
				}
				if(omsg.length>300) {
					alert("意见太长");
					return ;
				}
				$("#v_S_ctype").val('signplushandle');
			}
			else {
				$("#v_S_ctype").val('default');
			}
			
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formHandleSubmitUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formHandleSubmitUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_handle_back").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

// 			zt = 'handle';
			if(typeof btnAU.formHandleBackFunc == 'function') {
				var rf = btnAU.formHandleBackFunc();
				if(!rf) {
					return;
				}
			}
			$("#v_B_isagree").val('false');
			$("#v_S_ctype").val('adujst');
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formHandleBackUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formHandleBackUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		//加签
		$("#btn_handle_signplus").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			var omsg = "";
			if($("#comment").length>0) {
				omsg = $("#comment").val();
			}
			if(omsg == null || omsg.trim() == "") {
				alert("必须填写意见");
				return ;
			}
			
			if(omsg.length>300) {
				alert("意见太长");
				return ;
			}
			
			$.jBox.open("iframe:${ctx}/activiti/flowpage/positionjbox", "加签选择人员", 500, 400, {
				buttons: {
					"确定":"ok","关闭":true
				},
				submit:function(v, h, f){
					if (v=="ok"){
						
						var o = h.find("iframe")[0].contentWindow.document.getElementById("sys_personposition");
						var beAsigners = $(o).val();
						
						if(beAsigners == null || beAsigners == "") {
							alert("加签时至少选择一个人!");
							return false;
						}
						
// 						var om = h.find("iframe")[0].contentWindow.document.getElementById("sys_personmessage");
// 						var omsg = $(om).val();
// 						if(omsg == null || omsg.trim() == "") {
// 							alert("必须填写意见");
// 							return false;
// 						}
						
// 						if(omsg.length>300) {
// 							alert("意见太长");
// 							return false;
// 						}
						
						$.getJSON("${ctx}/activiti/flowpage/jsonsignplus", {
							taskid: btnAU.taskid,
							beAsigners: beAsigners,
							signplusmsg: omsg
						}, function(data){
							if(data.isrun) {
								
								$("#btn_handle_save").hide();
								$("#btn_handle_submit").hide();
								$("#btn_handle_signplus").hide();
								$("#btn_handle_back").hide();
								$("#btn_handle_delegate").hide();
								
								//暂时先隐藏
// 								$("#btn_handle_suspend").hide();
// 								$("#btn_handle_activate").hide();
 								$("#btn_handle_void").hide();  //作废按钮
								alert("加签成功!");
							}
							else {
								alert(data.message);
							}
						});
						
					}
				}
			});
		});
		
		$("#btn_handle_delegate").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			var omsg = "";
			if($("#comment").length>0) {
				omsg = $("#comment").val();
			}
// 			if(omsg == null || omsg.trim() == "") {
// 				alert("必须填写意见");
// 				return ;
// 			}
			
			if(omsg.length>300) {
				alert("意见太长");
				return ;
			}
			
			$.jBox.open("iframe:${ctx}/activiti/flowpage/delegatejbox", "转办选择人员", 500, 400, {
				buttons: {
					"确定":"ok","关闭":true
				},
				submit:function(v, h, f){
					if (v=="ok"){
						
						var o = h.find("iframe")[0].contentWindow.document.getElementById("sys_personposition");
						var beAsigners = $(o).val();
						
						if(beAsigners == null || beAsigners == "") {
							alert("请选择转办人!");
							return false;
						}
						
// 						var om = h.find("iframe")[0].contentWindow.document.getElementById("sys_personmessage");
// 						var omsg = $(om).val();

// 						if(omsg.length>300) {
// 							alert("意见太长");
// 							return false;
// 						}
						
						$.getJSON("${ctx}/activiti/flowpage/jsondelegate", {
							taskid: btnAU.taskid,
							beAsigners: beAsigners,
							delegatemsg: omsg
						}, function(data){
							if(data.isrun) {
								
								$("#btn_handle_save").hide();
								$("#btn_handle_submit").hide();
								$("#btn_handle_signplus").hide();
								$("#btn_handle_back").hide();
								$("#btn_handle_delegate").hide();
								
								//暂时先隐藏
// 								$("#btn_handle_suspend").hide();
// 								$("#btn_handle_activate").hide();
 								$("#btn_handle_void").hide();  //作废按钮
								alert("转办成功!");
							}
							else {
								alert(data.message);
							}
						});
						
					}
				}
			});
		});
		
		$("#btn_handle_suspend").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			var omsg = "";
			if($("#comment").length>0) {
				omsg = $("#comment").val();
			}
			if(omsg == null || omsg.trim() == "") {
				alert("必须填写意见");
				return ;
			}
			
			if(omsg.length>300) {
				alert("意见太长");
				return ;
			}
			
			if(confirm("确认暂停吗?")) {
				$.getJSON("${ctx}/activiti/flowpage/jsonsuspendinstance", {
					taskid: btnAU.taskid,
					reason: omsg
				}, function(data){
					if(data.isrun) {
						
						initializeButton(btnAU);
						alert("暂停成功!");
					}
					else {
						alert(data.message);
					}
				});
			}
			
			
		});
		
		$("#btn_handle_activate").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			var omsg = "";
			if($("#comment").length>0) {
				omsg = $("#comment").val();
			}
			if(omsg == null || omsg.trim() == "") {
				alert("必须填写意见");
				return ;
			}
			
			if(omsg.length>300) {
				alert("意见太长");
				return ;
			}
			
			if(confirm("确认启用吗?")) {
				$.getJSON("${ctx}/activiti/flowpage/jsonactivateinstance", {
					taskid: btnAU.taskid,
					reason: omsg
				}, function(data){
					if(data.isrun) {
						//刷新当前页面
						initializeButton(btnAU);
						alert("启用成功!");
					}
					else {
						alert(data.message);
					}
				});
			}
			
			
		});
		
		$("#btn_handle_void").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			var omsg = "";
			if($("#comment").length>0) {
				omsg = $("#comment").val();
			}
			if(omsg == null || omsg.trim() == "") {
				alert("必须填写意见");
				return ;
			}
			
			if(omsg.length>300) {
				alert("意见太长");
				return ;
			}
			
			if(confirm("确认作废吗?")) {
				var tablename = "";
				if(typeof btnAU.tablename != "undefined") {
					tablename = btnAU.tablename;
				}
				var voidMethod = "";
				if(typeof btnAU.voidMethod != "undefined") {
					voidMethod = btnAU.voidMethod;
				}
				
				$.getJSON("${ctx}/activiti/flowpage/jsonvoidinstance", {
					taskid: btnAU.taskid,
					reason: omsg,
					tablename: tablename,
					voidMethod: voidMethod
				}, function(data){
					if(data.isrun) {
						
						initializeButton(btnAU);
						alert("作废成功!");
					}
					else {
						alert(data.message);
					}
				});
			}
			
		});
		
		$("#btn_reportprint").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			window.open(btnAU.formPrintUrl);
		});
		
		$("#btn_handle_claim").click(function(){
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}


			if(confirm("确认签收吗?")) {
				$.getJSON("${ctx}/activiti/flowpage/jsonclaimtask", {
					taskid: btnAU.taskid,
					reason: ""
				}, function(data){
					if(data.isrun) {
						//刷新当前页面
						initializeButton(btnAU);
						alert("签收成功!");
					}
					else {
						alert(data.message);
					}
				});
			}
		});
		
	}
</script>
