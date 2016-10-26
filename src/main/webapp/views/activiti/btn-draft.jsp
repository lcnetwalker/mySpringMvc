<%@ page contentType="text/html;charset=UTF-8"%>

<div class="form-group margin-top-10">
	<div class="col-md-offset-5 col-md-4 row">
		<button class="demo-loading-btn btn blue" id="btn_save" style="display: none"
			data-loading-text="保存中..." type="button">保存</button>
		<button class="demo-loading-btn btn blue" id="btn_start" style="display: none"
			data-loading-text="提交中..." type="button">提交</button>
		<button type="button" class="btn default"
			onclick="history.go(-1)">取消</button>
	</div>
</div>
<script type="text/javascript">

	function initBtnDraft(btnAU) {
// 		$(document).live("UploadComplete", function(event) {
// 			$("#"+btnAU.formId).submit();
// 		});

		if(typeof btnAU.formSaveUrl != 'undefined') {
			if(btnAU.formSaveUrl != null && btnAU.formSaveUrl != '') {
				$("#btn_save").show();
			}
		}
		if(typeof btnAU.formStartFlowUrl != 'undefined') {
			if(btnAU.formStartFlowUrl != null && btnAU.formStartFlowUrl != '') {
				$("#btn_start").show();
			}
		}
		
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
		
		$("#btn_start").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			//zt = 'start';
			if(typeof btnAU.formStartFlowFunc == 'function') {
				var rf = btnAU.formStartFlowFunc();
				if(!rf) {
					return;
				}
			}
			$(document).trigger("btnclick", [$(this).attr("id")]);
			if(typeof filesubmit == 'function') {
				//$("#"+btnAU.formId).attr("action", btnAU.formSaveUrl);
				var trs = filesubmit();
				if(trs) {
					$("#"+btnAU.formId).attr("action", btnAU.formStartFlowUrl);
					$("#"+btnAU.formId).submit();
				}
				else {
					alert("请选点击上传文件，并等待文件上传完成!");
				}
			}
			else {
				$("#"+btnAU.formId).attr("action", btnAU.formStartFlowUrl);
				$("#"+btnAU.formId).submit();
			}
			
		});
	}
	
	
</script>
