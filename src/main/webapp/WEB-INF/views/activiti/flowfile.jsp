<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-align-justify"></i> 支持附件
		</div>
		<div class="tools"> 
			<a id="a_file_icon" class="expand" href="javascript:;"></a>
		</div>
	</div>
	<div id="div_file_content" class="portlet-body" style="display: none;">
		<div class="form-body form-horizontal">
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<!-- <label class="control-label col-md-2"></label> -->
					<div class="col-md-12">
					<button type="button" id="btn_fileadd" class="btn default">选择文件(最大100M)</button>
					<button type="button" id="btn_fileupload" class="btn default">上传文件</button> 
					</div>
				</div>
				<div class="form-group">
					<!-- <label class="control-label col-md-2"></label> -->
					<div class="col-md-12">
						<table id="fileTable"
							class="table table-striped table-bordered table-advance table-hover table-condensed">
							<thead>
								<tr>
									<th>文件名称</th>
									<th>文件大小</th>
									<th>进度</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="fileTbody">
							
							</tbody>
						</table>
						<label id="l_file_count"></label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2"></label>
					<div class="col-md-10" id="fileStatus">
						<input type="hidden" id="sys_flowfile_init" value=""/>
					</div>
				</div>
			</div>
		</div>
			<!--/span-->
		</div>
	</div>

</div>
<script type="text/javascript">
	var uploader = null;
	
	//参数为B
	function filesize(size) {
		if(size<1024) {
			return size + "B";
		}
		else if(size >= 1024 && size < 1024*1024) {
			return ((size*1.0)/1024).toFixed(2) + "KB";
		}
		else if(size >= 1024*1024 && size < 1024*1024*1024) {
			return ((size*1.0)/(1024*1024)).toFixed(2) + "MB";
		}
		else if(size >= 1024*1024*1024 && size < 1024*1024*1024*1024) {
			return ((size*1.0)/(1024*1024*1024)).toFixed(2) + "GB";
		}
		else if(size >= 1024*1024*1024*1024) {
			return ((size*1.0)/(1024*1024*1024*1024)).toFixed(2) + "TB";
		}
		return size+"B";
	}
	
	function allfilesize() {
		var size = 0;
		$.each($("input[name='filesize']"),function(index, item){
			size += $(item).val() * 1;
		});
		var allsize = filesize(size);
		return allsize;
	}
	
	function filesubmit() {
		//var uploader = $('#uploader').pluploadQueue();
		
		if (uploader != null && uploader.files.length > 0) {
			if (uploader.total.uploaded == uploader.files.length) {
				//$(document).trigger("UploadComplete");
				return true;
			}
			else {
				return false;
			}
			//uploader.start();
		} 
		return true;
	}
	
	//zt :  edit:编辑        view:只能查看
	function initfile(btnAU, zt) {
		if(typeof zt=="undefined") {
			zt = "view";
		}
		if(zt == "view") {
			$("#btn_fileadd").hide();
			$("#btn_fileupload").hide();
		}
		$("#btn_fileupload").click(function(){
			//filesubmit();
			uploader.start();
		});
		
		var up = {
				// General settings
	            runtimes : 'html5,gears,browserplus,silverlight,flash,html4',
	            browse_button : 'btn_fileadd',
	            url : '/activiti/flowpage/jsonupload',
	            max_file_size : '100mb',
	            unique_names: true,
	            //chunk_size: '2mb',
	            // Specify what files to browse for
// 	            filters : [
// 	                {title: "Image files", extensions: "jpg,gif,png"},
// 	                {title: "Zip files", extensions: "zip"},
// 	                {title: "Office files", extensions: "doc,xls,ppt,docx,xlsx,pptx"},
// 	            ],
//	            resize: {width: 640, height: 300, quality: 90},
	            multiple_queues: true,
	            //preinit:
	            // Flash settings
	            //flash_swf_url: 'plupload/plupload.flash.swf',
	            // Silverlight settings
	            //silverlight_xap_url: 'plupload/plupload.silverlight.xap',
	            // 参数
	            multipart_params: {'processDefinitionKey': btnAU.processDefinitionKey},
	            
	            init: {
	            	PostInit : function (up) {
	            		var processDefinitionKey=btnAU.processDefinitionKey;
	            		var bussinessKey = btnAU.bussinessKey;
	            		
	            		if(bussinessKey != null && bussinessKey != "" 
	            				&& processDefinitionKey != null && processDefinitionKey != "") {
	            			$.getJSON("${ctx}/activiti/flowpage/jsonfiles", {
	            				processDefinitionKey : processDefinitionKey,
	            				bussinessKey : bussinessKey
	            			}, function(data){
	            				$("#sys_flowfile_init").val("complete");
	            				
	            				if(data.files && data.files.length > 0) {
	            					$("#a_file_icon").attr("class", "collapse");
	            					$("#div_file_content").show();
	            					
	            					$.each(data.files, function(index, file){
	            						var hstr = "<tr id='tr_"+file.id +"'>"
	    	            				+ "<input type='hidden' id='input_fileid_"+file.id+"' name='fileid' value='"+file.id+"'/>"
	    	            				+ "<input type='hidden' id='input_filename_"+file.id+"' name='filename' value='"+file.filename+"'/>"
	    	            				+ "<input type='hidden' id='input_filesize_"+file.id+"' name='filesize' value='"+file.filesize+"'/>"
	    	            				+ "<input type='hidden' id='input_afrescoid_"+file.id+"' name='afrescoid' value='"+file.afrescoid+"'/>"
	    	            				+ "<td><a href='/activiti/flowpage/downloadfile/"+file.afrescoid+"' >" + file.filename + "</a></td>" 
	    	            				+ "<td>" + filesize(file.filesize)+ "</td>" 
	    	            				+ "<td id='tr_percent_"+file.id+"'>"+((file.afrescoid!=null&&file.afrescoid!="")?"已上传":"上传失败")+"</td>" 
	    	            				+ "<td>"
	    	            				+ '<a href="/activiti/flowpage/downloadfile/'+file.afrescoid+'" name="fileDownload" data-fileid="'
	    	            				+ file.id
	    	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
	    								+ '	data-toggle="tooltip" title="下载" data-placement="top"> '
	    								+ ' <li class="fa fa-download"></li></a> &nbsp;&nbsp;';
	    								if(file.viewstatus=="0") {  //可以预览
	    									hstr += 
	    									'<a href="/views/pdf/viewer.jsp?file=/activiti/flowpage/downloadfile/'+file.afrescoid+'%3Fispdf%3Dtrue" target="_blank" name="fileView" data-fileid="'
		    	            				+ file.id
		    	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
		    								+ '	data-toggle="tooltip" title="预览" data-placement="top"> '
		    								+ ' <li class="fa fa-search"></li></a> &nbsp;&nbsp;';
	    								}
	    								
										if(zt && zt=="edit") {
	    	            					hstr +='<a href="javascript:;" name="fileDel" data-fileid="'
			    	            				+ file.id
			    	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
			    								+ '	data-toggle="tooltip" title="删除" data-placement="top"> '
			    								+ ' <li class="fa fa-trash-o"></li></a> ';
	    	            				}
	    								
										hstr += "</td></tr>";
	    	            				$("#fileTbody").append(hstr);
	    	            			
	            					});
	            					
	            					$("#l_file_count").empty();
	            					$("#l_file_count").append("共" + data.files.length + "个文件,合计" + allfilesize());
	            					
	            				}
	            			});
	            		}
	            		else {
	            			$("#sys_flowfile_init").val("complete");
	            		}
	            	},
	            	FilesAdded : function(up, files){
	            		plupload.each(files, function(file) {
	            			var hstr = "<tr id='tr_"+file.id +"'>"
	            				+ "<input type='hidden' id='input_fileid_"+file.id+"' name='fileid' />"
	            				+ "<input type='hidden' id='input_filename_"+file.id+"' name='filename' value='"+file.name+"'/>"
	            				+ "<input type='hidden' id='input_filesize_"+file.id+"' name='filesize' value='"+file.size+"'/>"
	            				+ "<input type='hidden' id='input_afrescoid_"+file.id+"' name='afrescoid' />"
	            				+ "<td><a href='javascript:;' id='a_filename_download_"+file.id+"' >" + file.name + "</a></td>" 
	            				+ "<td>" + filesize(file.size)+ "</td>" 
	            				+ "<td id='tr_percent_"+file.id+"'>" + file.percent + "%</td>" 
	            				+ "<td>"
	            				+ '<a href="javascript:;" id="a_download_'+file.id+'" name="fileDownload" data-fileid="'
	            				+ file.id
	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
								+ '	data-toggle="tooltip" title="下载" data-placement="top"> '
								+ ' <li class="fa fa-download"></li></a> &nbsp;&nbsp;';
// 							hstr += 
// 								'<a href="javascript:;" id="a_view_'+file.id+'" target="_blank" name="fileView" data-fileid="'
//    	            				+ file.id
//    	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
//    								+ '	data-toggle="tooltip" title="预览" data-placement="top"> '
//    								+ ' <li class="fa fa-search"></li></a> &nbsp;&nbsp;';
	            			hstr += '<a href="javascript:;" name="fileDel" data-fileid="'
	            				+ file.id
	            				+'" onMouseOver="$(this).tooltip(\'show\')" '
								+ '	data-toggle="tooltip" title="删除" data-placement="top"> '
								+ ' <li class="fa fa-trash-o"></li></a> '
	            				+ "</td>"
	            				+"</tr>";
	            			$("#fileTbody").append(hstr);
	            			if($("#fileTbody").children("tr").length==0) {
	            				$("#l_file_count").empty();
	        					$("#l_file_count").append("");
	        				}
	        				else {
	        					$("#l_file_count").empty();
	        					$("#l_file_count").append("共"+$("#fileTbody").children("tr").length+"个文件,合计" + allfilesize());
	        				}
	            		});
	        		},
	        		FileUploaded : function(up, files, res) {
	        			var d=jQuery.parseJSON( res['response'] );
	        			var afrescoid = d.afrescoid;
	        			//var viewstatus = d.viewstatus;
// 	        			$("#input_filename_"+files.id).val(files.name);
// 	        			$("#input_filesize_"+files.id).val(files.size);
	        			$("#input_afrescoid_"+files.id).val(afrescoid);
	        			if(afrescoid == null || afrescoid == "") {
	        				$("#tr_percent_"+files.id).html("上传失败");
	        				return;
	        			}
	        			else {
	        				$("#tr_percent_"+files.id).html("已上传");
	        			}
	        			
	        			$("#a_download_"+files.id).attr("href", "/activiti/flowpage/downloadfile/"+afrescoid+"?filename="+files.name);
// 	        			if(viewstatus=='0') { //可以预览
// 	        				$("#a_view_"+files.id).attr("href", "/views/pdf/viewer.jsp?file=/activiti/flowpage/downloadfile/"+afrescoid+"%3Fispdf%3Dtrue");
// 	        			}
// 	        			else {
// 	        				$("#a_view_"+files.id).hide();
// 	        			}
	        			
	        			$("#a_filename_download_"+files.id).attr("href", "/activiti/flowpage/downloadfile/"+afrescoid+"?filename="+files.name);
	        		},
// 	        		FileRemoved : function (up, files) {
	        			
// 	        		},
	        		UploadFile : function (up, files) {
	        			
	        		},
	        		UploadComplete : function (up, files) {
	        			var isuploadsuccess = true;
	        			$.each($("input[name='afrescoid']"), function(index, item){
	        				var afrescoid = $(item).val();
	        				if(afrescoid == null || afrescoid == "") {
	        					isuploadsuccess=false;
	        				}
	        			});
	        			if(!isuploadsuccess) {
	        				alert("有未上传成功的文件，请联系文档系统管理员!");
	        			}
	        			$(document).trigger("UploadComplete");
	        		},
	        		UploadProgress : function(up, files) {
	        			$("#tr_percent_"+files.id).html("已传输" +files.percent+"%");
	        			if(files.percent==100) {
	        				$("#tr_percent_"+files.id).html("正在保存,请稍候");
	        			}
	        		},
	        		Error : function (up, err) {
	        			if(err.code==-600) {
	        				alert("文件超过100M,请压缩后上传!");
	        			}
	        			else {
	        				alert(err.message);
	        			}
	        			
	        		}
	            },
		};
		
		uploader = new plupload.Uploader(up);
		
		uploader.init();
		
		$("a[name='fileDel']").live("click", function(event){
			if(confirm("确认要删除吗?")) {
				var fileid = $(this).data('fileid');
				uploader.removeFile(fileid);
				$("#tr_"+fileid).remove();
				if($("#fileTbody").children("tr").length==0) {
					$("#l_file_count").empty();
					$("#l_file_count").append("");
				}
				else {
					$("#l_file_count").empty();
					$("#l_file_count").append("共"+$("#fileTbody").children("tr").length+"个文件,合计" + allfilesize());
				}
				
			}
			
		});
		
		
		//$("#uploader").pluploadQueue(up);
		
	}

</script>