<%@ page contentType="text/html;charset=UTF-8"%>

<div class="portlet box">
	<!-- 
	<div class="portlet-body" >
		<div class=" form-body form-horizontal">
			<div class="row">-->
			
				<div class="col-md-12" >
					<!--<label class="control-label col-md-4"></label> -->
					<input type="hidden" id="sys_hidden_postid" name="postid" value=""/>
					
					<input type="hidden" id="sys_positionsel_init" value=""/>
					<div style="padding:7px" id="position_list" class="btn-group pull-right " data-toggle="buttons">
						<%--<label></label>
						
						<label class="btn btn-default active"> 
						<input type="radio" class="toggle" name="postid"> 岗位1
						</label> 
						<label class="btn btn-default"> 
						<input type="radio" class="toggle" name="postid"> 岗位2
						</label>
						 --%> 
					</div>
			<!-- 	 </div>
			</div>	
		</div> -->
</div>
</div>
<script type="text/javascript">
	function initpositions(pernr,defaultPostId,appda,zt) {
		
		jQuery.getJSON("/activiti/flowpage/jsonpositionlist",{
			pernr:pernr,
			appda:appda
		},function(data){
			$("#sys_positionsel_init").val("complete");
			//var d = json_parse(data);
			var pstr = "";
			jQuery.each(data.positionlist, function(index, item){
				if(zt=="view") {
					if(defaultPostId != null && defaultPostId != ""){
						if(item.objid!=defaultPostId) {
							return true;  // false时相当于break, 如果return true 就相当于continure。
						}
					}
				}
				pstr += '<label name="positionsel" class="btn btn-default ';
				var issel = false;
				if(defaultPostId != null && defaultPostId != "") {
					if(item.objid==defaultPostId) {
						
						pstr += "active";
						issel=true;
					}
				}
				else {
					jQuery.each(data.mainPositions, function(mindex,mitem){
						
						if(item.objid==mitem.objid) {
							
							pstr += "active";
							issel=true;
						}
					});
				}
				pstr += '" >';
				if(issel) {
					$("#sys_hidden_postid").val(item.objid);
					pstr += '<input type="radio" class="toggle" name="sys_postid" checked="checked" value="'+item.objid+'"> ' +item.stext;
				}
				else {
					pstr += '<input type="radio" class="toggle" name="sys_postid" value="'+item.objid+'"> ' +item.stext;
				}
				
				pstr += '</label>';
			});
			$("#position_list").append(pstr);
			
			if(defaultPostId != null && defaultPostId != "" 
					&& $("#sys_hidden_postid").val()=="") {
				
				$("#sys_hidden_postid").val(defaultPostId);
			}
			
			//$(document).trigger("positioninit", [$("input[name='postid'][checked='checked']").val()]);
			
			$(document).trigger("positioninit", [$("#sys_hidden_postid").val()]);
			$(document).trigger("syspositioninit", [$("#sys_hidden_postid").val(), appda]);
			
			$("label[name='positionsel']").click(function(){
				var io=$(this).find("input");
				$("#sys_hidden_postid").val(io.val());
				$.each($("input[name='sys_postid'][type='radio']"), function(index, item){
					if($(item).val()!=io.val()) {
						$(item).removeAttr("checked");
					}
				});
				
				io.attr("checked", "checked");
				
			});
			
			
			
			$("input[name='sys_postid'][type='radio']").change(function(){
				if($(this).attr("checked")=="checked") {
					//if($(this).data("events")["positionchange"]) {
						$(document).trigger("positionchange",[$(this).val()]);
						$(document).trigger("syspositionchange",[$(this).val(), appda]);
					//}
					
				}
			});
			
			
		});
		
		
		
		
		
		//$("#position_list").click(function(){
			
			//alert($("label[name='positionsel'][class='btn btn-default']").length);
			//alert($("label[name='positionsel'][class='btn btn-default']").find("input").attr("value"));
		//});
		
	} 
	
</script>