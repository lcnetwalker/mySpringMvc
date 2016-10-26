<%@ page contentType="text/html;charset=UTF-8"%>

<div class="form-group margin-top-10">
	<div class="col-md-offset-5 col-md-4 row">
		<button class="demo-loading-btn btn blue" id="btn_resave" style="display: none"
			data-loading-text="保存中..." type="button">保存</button>
		<button class="demo-loading-btn btn blue" id="btn_resubmit" style="display: none"
			data-loading-text="提交中..." type="button">重新提交</button>
		<button class="demo-loading-btn btn blue" id="btn_close" style="display: none"
			data-loading-text="关闭中..." type="button">关闭流程</button>
		<button type="button" class="btn default"
			onclick="history.go(-1)">取消</button>
	</div>
</div>
<script type="text/javascript">
	function initializeButton(btnAU) {
		if(typeof btnAU.formReSaveUrl != 'undefined') {
			if(btnAU.formReSaveUrl != null && btnAU.formReSaveUrl != '') {
				$("#btn_resave").show();
			}
		}
		if(typeof btnAU.formReSubmitUrl != 'undefined') {
			if(btnAU.formReSubmitUrl != null && btnAU.formReSubmitUrl != '') {
				$("#btn_resubmit").show();
			}
		}
		
		if(typeof btnAU.formReCloseUrl != 'undefined' && btnAU.formReCloseUrl != '') {
			$("#btn_close").show();
		}
		
	}
	
	function initBtnReSubmit(btnAU) {
		$(document).ajaxComplete(function(event, xhr){
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
		});
		
		$("#btn_resave").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'resave';
			if(typeof btnAU.formReSaveFunc == 'function') {
				var rf = btnAU.formReSaveFunc();
				if(!rf) {
					return;
				}
			}
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formReSaveUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formReSaveUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_resubmit").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'resubmit';
			if(typeof btnAU.formReSubmitFunc == 'function') {
				var rf = btnAU.formReSubmitFunc();
				if(!rf) {
					return;
				}
			}
			$("#v_B_isagree").val('true');
			$("#v_S_ctype").val('reject');
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formReSubmitUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formReSubmitUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
		
		$("#btn_close").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'resubmit';
			if(typeof btnAU.formReCloseFunc == 'function') {
				var rf = btnAU.formReCloseFunc();
				if(!rf) {
					return;
				}
			}
			$("#v_B_isagree").val('false');
			$("#v_S_ctype").val('cancel');
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formReCloseUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formReCloseUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
	}
</script>
