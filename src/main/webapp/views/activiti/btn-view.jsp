<%@ page contentType="text/html;charset=UTF-8"%>

<div class="form-group margin-top-10">
	<div class="col-md-offset-5 col-md-7 row">
		<button class="demo-loading-btn btn blue" id="btn_withdraw" style="display: none;"
			data-loading-text="抽单中..." type="button">抽单</button>
		<button class="demo-loading-btn btn blue" id="btn_reportprint" style="display: none;"
			data-loading-text="打印中..." type="button">打印</button>
		<button class="demo-loading-btn btn blue" id="btn_cuiban" style="display: none;"
				data-loading-text="催办中..." type="button">催办</button>
		<button type="button" class="btn blue"
			onclick="history.go(-1)">取消</button>
		<a id="a_sys_gotohandle" class="pull-right" href="javascript:;" style="display: none;">任务在我这，去办理</a>
	</div>
</div>
<script type="text/javascript">
	function initBtnView(btnAU) {
		
		if(typeof btnAU.formPrintUrl != 'undefined') {
			if(btnAU.formPrintUrl != null && btnAU.formPrintUrl != '') {
				$.getJSON("${ctx}/activiti/flowpage/jsonisuseprint", {
					proc_inst_id : btnAU.proc_inst_id
				}, function(data){
					if(data) {
						$("#btn_reportprint").show();
					}
				});
				
			}
		}
		
		$.getJSON("${ctx}/activiti/flowpage/jsonisusewithdraw", {
			proc_inst_id : btnAU.proc_inst_id,
			postid: btnAU.startuserpostid,
			directLeaderTaskDefinitionKey: btnAU.directLeaderTaskDefinitionKey
		}, function(data) {
			if(data) {
				$("#btn_withdraw").show();
			}
		});

		$.getJSON("${ctx}/activiti/flowpage/jsonisusecuiban", {
			proc_inst_id : btnAU.proc_inst_id,
			postid: btnAU.startuserpostid
		}, function(data) {
			if(data) {
				$("#btn_cuiban").show();
			}
		});

		$.getJSON("${ctx}/activiti/flowpage/jsonisusegotohandle", {
			proc_inst_id : btnAU.proc_inst_id
		}, function(data){
			if(data.isusegotohandle) {
				var businessKey = data.businessKey;
				var taskId=data.taskId;
				var key = data.key;

				$("#a_sys_gotohandle").attr("href", "/msg/dbrwtz/"+key+"/"+businessKey+"/"+btnAU.proc_inst_id+"/"+taskId+"?ly=list");
				$("#a_sys_gotohandle").show();
			}
		});
		
		$("#btn_withdraw").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			if(confirm("确认抽单吗?")) {
				$.getJSON("${ctx}/activiti/flowpage/jsonwithdraw", {
					proc_inst_id : btnAU.proc_inst_id,
					applyTaskDefinitionKey: btnAU.applyTaskDefinitionKey,
					withdrawMethod:btnAU.withdrawMethod
				}, function(data) {
					if(data) {
						$("#btn_withdraw").hide();
						alert("抽单成功,请到待办任务列表办理!");
					}
					else {
						alert("抽单失败!");
					}
				});
			}
			
		});
		
		$("#btn_reportprint").click(function(){
			//判断当前用户是否存在tab页切换过账号
			var rb = syscheckuser();
			if(!rb) {
				alert("您的账号无效, 请退出重新登录!");
				return;
			}

			window.open(btnAU.formPrintUrl);
		});

		$("#btn_cuiban").click(function(){
			$.getJSON("${ctx}/activiti/flowpage/jsoncuibaners", {
				proc_inst_id : btnAU.proc_inst_id
			}, function(data) {
				var assigneeName = data.assigneeName;

				if(assigneeName != '') {
					if(confirm("是否催办" + assigneeName + "?")) {
						$.getJSON("${ctx}/activiti/flowpage/jsoncuiban", {
							proc_inst_id : btnAU.proc_inst_id
						}, function(data) {

							if(data) {
								alert("催办成功!");
							}
						});
					}
				}
			});
		});
	}
</script>
