<%@ page contentType="text/html;charset=UTF-8"%>

<div class="form-group margin-top-10">
	<div class="col-md-offset-5 col-md-4 row">
		<button class="demo-loading-btn btn blue" id="btn_save" style="display: none;"
			data-loading-text="保存中..." type="button">保存</button>
		<button class="demo-loading-btn btn blue" id="btn_withdraw_submit" style="display: none;"
			data-loading-text="提交中..." type="button">提交</button>
		<button class="demo-loading-btn btn blue" id="btn_handle_void" style="display: none;"
			data-loading-text="作废中..." type="button">作废</button>
		<button type="button" class="btn default"
			onclick="history.go(-1)">取消</button>
	</div>
</div>
<script type="text/javascript">
	function initializeButton(btnAU) {
		if(typeof btnAU.taskid != "undefined") {
			if(btnAU.taskid != "") {
				$.getJSON("${ctx}/activiti/flowpage/jsonishandleauthority", {
					taskid: btnAU.taskid
				}, function(data) {
					if(data.suspensionState==1) {  
						//启用
						if(data.isOwner || data.isAssignee) {
							if(typeof btnAU.formSaveUrl != 'undefined') {
								if(btnAU.formSaveUrl != null && btnAU.formSaveUrl != '') {
									$("#btn_save").show();
								}
							}
							if(typeof btnAU.formWithdrawSubmitUrl != 'undefined') {
								if(btnAU.formWithdrawSubmitUrl != null && btnAU.formWithdrawSubmitUrl != '') {
									$("#btn_withdraw_submit").show();
								}
							}
							if(typeof btnAU.isusevoid == "undefined" || btnAU.isusevoid == true) {
								$("#btn_handle_void").show();
							}
						}
					}
					else if(data.suspensionState==2){ //暂停
						$("#btn_save").hide();
						$("#btn_withdraw_submit").hide();
						$("#btn_handle_void").hide();
					}
					else if(data.suspensionState==3){ //作废
						$("#btn_save").hide();
						$("#btn_withdraw_submit").hide();
						$("#btn_handle_void").hide();
					}
					
				});
				
				
			}
		}
	}
	
	function initBtnAfterWithDraw(btnAU) {
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
		
		
		$("#btn_save").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'save';
			if(typeof btnAU.formSaveFunc == 'function') {
				var rf = btnAU.formSaveFunc();
				if(!rf) {
					return;
				}
			}
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_withdraw_submit").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'afterWithdraw';
			if(typeof btnAU.formWithdrawSubmitFunc == 'function') {
				var rf = btnAU.formWithdrawSubmitFunc();
				if(!rf) {
					return;
				}
			}
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formWithdrawSubmitUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formWithdrawSubmitUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_handle_void").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
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
					reason: "抽单后作废",
					tablename: tablename,
					voidMethod: voidMethod
				}, function(data){
					if(data.isrun) {
						
						$("#btn_save").hide();
						$("#btn_withdraw_submit").hide();
						$("#btn_handle_void").hide();
						alert("作废成功!");
					}
					else {
						alert(data.message);
					}
				});
			}
			
		});
	}
</script>
