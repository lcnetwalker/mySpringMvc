<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 审批意见一 模块内容2 -->
<div class="portlet box">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-th-list"></i>审批意见
		</div>
		<div class="tools">
			<a class="collapse" href="javascript:;"></a>
		</div>
	</div>
	<div class="portlet-body" style="display:;">
		<div class=" form-body form-horizontal">
			<div class="form-group">
					<!-- <label class="control-label col-md-2"></label> -->
					<div class="col-md-12">
					<button type="button"  class="btn default" onclick="layerArea()" onmouseover="$(this).tooltip('show')" 
						data-toggle="tooltip" title="" data-placement="top" data-original-title="点击选择">选择意见</button>
					</div>
				</div>
			<div class="form-group">
				<!-- <label class="col-md-2 control-label">审批意见</label> -->
				<div class="col-md-12 form-inline">
					<textarea id="comment" name="comment" type="text" rows="5"
						class="form-control span12 input-sm" placeholder="请填写意见"
						 ></textarea>
					<input type="hidden" id="layeryijianT" >
					<input type="hidden" id="v_B_isagree" name="v_B_isagree" value="false"/>
					<input type="hidden" id="v_S_ctype" name="v_S_ctype" value="default"/>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end 审批意见 -->
<script type="text/javascript">

function initdraftcomment(taskid) {
	if(taskid!=null&&taskid!="") {
		$.getJSON("/activiti/flowpage/jsondraftcomment",{
			taskid:taskid
		}, function(data){
			if(data.draftComment) {
				$("#comment").val(data.draftComment);
			}
			
		});
	}
}


var change = function(index, layero){
     $('.areatest').on('click', function(){
      var action = $(this).index();
   });
};
function layerArea(){
    $.layer({
        title:'请选择审批意见',
        type: 1,
        area: ['420px', '260px'],
        page: {
            html: "<table id='yijian2' class='table table-condensed '>"
    			+ "<tr><td><span class='fa fa-angle-double-right'></span>同意!</td></tr>"
    			+ "<tr><td><span class='fa fa-angle-double-right'></span>返回再议!</td></tr>"
    			+ "<tr><td><span class='fa fa-angle-double-right'></span>请尽快办理!</td></tr>"
    			+ "</table>",		
        }, 
        btns:2,
        btn:['确认','取消'],
        yes:function(){
        	 $("#comment").val($('#layeryijianT').val());
        	 layer.closeAll()
            },
        success: function(layero){
            change(layer.index, layero);
        }
    });
    $('#yijian2 tr').click(function(){
		$('#yijian2 tr').removeClass('active1');
		$(this).addClass('active1');
		$('#layeryijianT').val($(this).text());			
		  });
    $('#yijian2 tr').dblclick(function(){
    	$('#yijian2 tr').removeClass('active1');
		$(this).addClass('active1');
		$('#comment').val($(this).text());			
		layer.closeAll()
        });
};

</script>