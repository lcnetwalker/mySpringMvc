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
									<img id="image" src="#" />
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
<script type="text/javascript" src="${ctx }/static/assets/js/qtip/jquery.qtip.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init(); // initlayout and core plugins
        
        var backurl = "${backurl}";
        if(backurl != "") {
        	$("#li_back").show();
        	$("#a_back").attr("href", backurl);
        	$("#a_processlog").attr("href", $("#a_processlog").attr("href") + "?backurl=" + backurl);
        }
        
        $.fn.outerHTML = function() {

            // IE, Chrome & Safari will comply with the non-standard outerHTML, all others (FF) will have a fall-back for cloning
            return (!this.length) ? this : (this[0].outerHTML ||
            (function(el) {
                var div = document.createElement('div');
                div.appendChild(el.cloneNode(true));
                var contents = div.innerHTML;
                div = null;
                return contents;
            })(this[0]));

        };
        
        
        $("#image").load(function(){
        	var maxWidth = 900;
        	var maxHeight = 450;
        	
        	var ratio = 1;
        	
        	var width = $("#image").width();
           	if(width > maxWidth) {
           		ratio = maxWidth * 1.0 / width;
           		$("#image").css("width", maxWidth);
           	}
           	
           	$.getJSON("${ctx}/activiti/trace/json/${processInstance.processInstanceId}", function(datas) {
            	var positionHtml = "";
    			
                // 生成图片
                //var varsArray = new Array();
                var activityIdArray = new Array();
                $.each(datas, function(i, v) {
                	if(v.activityType=="userTask") {   //用户任务
	                    var $userTaskDiv = $('<div/>', {
	                        'class': 'activity-userTask'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        backgroundColor: 'white',
	                        opacity: 0,
	                        zIndex: $.fn.qtip.zindex - 1
	                    });
	
	                    // 节点边框
	                    var $userTaskBorder = $('<div/>', {
	                        'class': 'activity-userTask-border'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        zIndex: $.fn.qtip.zindex - 2
	                    });
						
	                    if (v.currentActivity) {
	                        $userTaskBorder.css({
	                            border: '3px solid red'
	                        });
	                    } else if(v.vars['任务状态'] == '已完成') { // 已完成的任务
	                    	$userTaskBorder.css({
	                            border: '2px solid blue'
	                        });
	                    } else {
	                    	$userTaskBorder.css({
	                            border: '2px solid purple'
	                        });
	                    }
	                    positionHtml += $userTaskDiv.outerHTML() + $userTaskBorder.outerHTML();
	                    //varsArray[varsArray.length] = v.vars;
	                    activityIdArray[activityIdArray.length] = v.activityId;
                	}
                	else if(v.activityType=="startEvent") {   //发起环节
                		var $startEventDiv = $('<div/>', {
	                        'class': 'activity-startEvent'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        backgroundColor: 'white',
	                        opacity: 0,
	                        zIndex: $.fn.qtip.zindex - 1
	                    });
	
	                    // 节点边框
	                    var $startEventBorder = $('<div/>', {
	                        'class': 'activity-startEvent-border'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        zIndex: $.fn.qtip.zindex - 2
	                    });
	                    $startEventBorder.css({
                            border: '2px solid blue'
                        });
	                    
	                    positionHtml += $startEventDiv.outerHTML() + $startEventBorder.outerHTML();
                	}
					else if(v.activityType=="endEvent") {   //结束环节
						var $endEventDiv = $('<div/>', {
	                        'class': 'activity-startEvent'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        backgroundColor: 'white',
	                        opacity: 0,
	                        zIndex: $.fn.qtip.zindex - 1
	                    });
	
	                    // 节点边框
	                    var $endEventBorder = $('<div/>', {
	                        'class': 'activity-startEvent-border'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        zIndex: $.fn.qtip.zindex - 2
	                    });
	                    $endEventBorder.css({
                            border: '2px solid blue'
                        });
	                    
	                    positionHtml += $endEventDiv.outerHTML() + $endEventBorder.outerHTML();
                	}
					else if(v.activityType=="gateway") {   //网关
						var $gatewayDiv = $('<div/>', {
	                        'class': 'activity-startEvent'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        backgroundColor: 'white',
	                        opacity: 0,
	                        zIndex: $.fn.qtip.zindex - 1
	                    });
	
	                    // 节点边框
	                    var $gatewayBorder = $('<div/>', {
	                        'class': 'activity-startEvent-border'
	                    }).css({
	                        position: 'absolute',
	                        left: (v.x * ratio),
	                        top: ((v.y - 1) + 52) * ratio,
	                        width: v.width * ratio,
	                        height: v.height * ratio,
	                        zIndex: $.fn.qtip.zindex - 2
	                    });
	                    $gatewayBorder.css({
                            border: '2px solid blue'
                        });
	                    
	                    positionHtml += $gatewayDiv.outerHTML() + $gatewayBorder.outerHTML();
					}
                });
                
                $('#traceImage').append(positionHtml);
                
                // 设置每个节点的data
                $('.activity-userTask').each(function(i, v) {
                    //$(this).data('vars', varsArray[i]);
                    $(this).data('activityId', activityIdArray[i]);
                });
                
             // 此处用于显示每个节点的信息，如果不需要可以删除
                $('.activity-userTask').qtip({
                    content: function() {
                        //var vars = $(this).data('vars');
                        var activityId = $(this).data('activityId');
                       
                        var tipContent = "<table class='need-border'>";
                        var m = 0;
                        $.each(datas, function(i, v) {
                        	if(v.activityId==activityId) {
                        		if(m > 0) {
                        			tipContent += "<tr><td colspan='2'><hr width='100%' size=1/></td></tr>";
                        		}
                        		if(v.vars) {
                        			$.each(v.vars, function(varKey, varValue){
                            			if (varValue) {
                                            tipContent += "<tr><td>" + varKey + "</td><td>" + varValue + "<td/></tr>";
                                        }
                            		});
                        		}
                        		
                        		m = m + 1;
                        	}
                        });
                        
                        tipContent += "</table>";
                        return tipContent;
                    },
                    position: {
                        at: 'top right',
                        adjust: {
                            x: 3,
                            y: -40
                        }
                    }
                });
                // end qtip
            });
        });
       	
        $("#image").attr("src", "${ctx }/activiti/process/resources/image/${processInstance.processDefinitionId}");
        
    });
    function page(n,s){
        $("#pageNo").val(n);
        $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }
</script>
</content>