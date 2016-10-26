<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box cyftbl" style="display:;">
    <div class="portlet-body" style="display:;">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">餐饮费信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <button type="button" class="btn " id="btn_addtr_cyf">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="cyftbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>日期</th>
                                <th>发生地</th>
                                <th>消费金额</th>
                                <th>事由</th>
                                <th>超标准费用</th>
                                <th <c:if test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(cyfs) > 0 }">
                                <c:forEach items="${cyfs}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td >
                                            <input type="text" class=" form-control cyf_date disab" name="cyf_date"
                                                   value="<fmt:formatDate value="${item.cyf_date}" pattern="yyyy-MM-dd" type="date" dateStyle="full" />" <c:if
                                                    test="${flag eq 'view' || flag eq 'handle' }">
                                                   disabled='disabled' </c:if>>
                                        </td>
                                        <td >
                                            <SELECT name="cyf_place"  class="form-control disab "
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>
                                                    row='1'>
                                                <OPTION value="">请选择</OPTION>
                                                <OPTION value='北京' <c:if test="${ item.cyf_place eq '北京'}">selected="selected" </c:if>>北京</OPTION>
                                                <OPTION value='上海' <c:if test="${ item.cyf_place eq '上海'}">selected="selected" </c:if>>上海</OPTION>
                                                <OPTION value='广州' <c:if test="${ item.cyf_place eq '广州'}">selected="selected" </c:if>>广州</OPTION>
                                                <OPTION value='深圳' <c:if test="${ item.cyf_place eq '深圳'}">selected="selected" </c:if>>深圳</OPTION>
                                                <OPTION value='青岛' <c:if test="${ item.cyf_place eq '青岛'}">selected="selected" </c:if>>青岛</OPTION>
                                                <OPTION value='苏州' <c:if test="${ item.cyf_place eq '苏州'}">selected="selected" </c:if>>苏州</OPTION>
                                                <OPTION value='南京' <c:if test="${ item.cyf_place eq '南京'}">selected="selected" </c:if>>南京</OPTION>
                                                <OPTION value='无锡' <c:if test="${ item.cyf_place eq '无锡'}">selected="selected" </c:if>>无锡</OPTION>
                                                <OPTION value='宁波' <c:if test="${ item.cyf_place eq '宁波'}">selected="selected" </c:if>>宁波</OPTION>
                                                <OPTION value='温州' <c:if test="${ item.cyf_place eq '温州'}">selected="selected" </c:if>>温州</OPTION>
                                                <OPTION value='杭州' <c:if test="${ item.cyf_place eq '杭州'}">selected="selected" </c:if>>杭州</OPTION>
                                                <OPTION value='济南' <c:if test="${ item.cyf_place eq '济南'}">selected="selected" </c:if>>济南</OPTION>
                                                <OPTION value='厦门' <c:if test="${ item.cyf_place eq '厦门'}">selected="selected" </c:if>>厦门</OPTION>
                                                <OPTION value='福州' <c:if test="${ item.cyf_place eq '福州'}">selected="selected" </c:if>>福州</OPTION>
                                                <OPTION value='南宁' <c:if test="${ item.cyf_place eq '南宁'}">selected="selected" </c:if>>南宁</OPTION>
                                                <OPTION value='海口' <c:if test="${ item.cyf_place eq '海口'}">selected="selected" </c:if>>海口</OPTION>
                                                <OPTION value='三亚' <c:if test="${ item.cyf_place eq '三亚'}">selected="selected" </c:if>>三亚</OPTION>
                                                <OPTION value='重庆' <c:if test="${ item.cyf_place eq '重庆'}">selected="selected" </c:if>>重庆</OPTION>
                                                <OPTION value='成都' <c:if test="${ item.cyf_place eq '成都'}">selected="selected" </c:if>>成都</OPTION>
                                                <OPTION value='兰州' <c:if test="${ item.cyf_place eq '兰州'}">selected="selected" </c:if>>兰州</OPTION>
                                                <OPTION value='银川' <c:if test="${ item.cyf_place eq '银川'}">selected="selected" </c:if>>银川</OPTION>
                                                <OPTION value='西宁' <c:if test="${ item.cyf_place eq '西宁'}">selected="selected" </c:if>>西宁</OPTION>
                                                <OPTION value='拉萨' <c:if test="${ item.cyf_place eq '拉萨'}">selected="selected" </c:if>>拉萨</OPTION>
                                                <OPTION value='乌鲁木齐' <c:if test="${ item.cyf_place eq '乌鲁木齐'}">selected="selected" </c:if>>乌鲁木齐</OPTION>
                                                <OPTION value='昆明' <c:if test="${ item.cyf_place eq '昆明'}">selected="selected" </c:if>>昆明</OPTION>
                                                <OPTION value='贵阳' <c:if test="${ item.cyf_place eq '贵阳'}">selected="selected" </c:if>>贵阳</OPTION>
                                                <OPTION value='天津' <c:if test="${ item.cyf_place eq '天津'}">selected="selected" </c:if>>天津</OPTION>
                                                <OPTION value='石家庄' <c:if test="${ item.cyf_place eq '石家庄'}">selected="selected" </c:if>>石家庄</OPTION>
                                                <OPTION value='沈阳' <c:if test="${ item.cyf_place eq '沈阳'}">selected="selected" </c:if>>沈阳</OPTION>
                                                <OPTION value='大连' <c:if test="${ item.cyf_place eq '大连'}">selected="selected" </c:if>>大连</OPTION>
                                                <OPTION value='长春' <c:if test="${ item.cyf_place eq '长春'}">selected="selected" </c:if>>长春</OPTION>
                                                <OPTION value='哈尔滨' <c:if test="${ item.cyf_place eq '哈尔滨'}">selected="selected" </c:if>>哈尔滨</OPTION>
                                                <OPTION value='呼和浩特' <c:if test="${ item.cyf_place eq '呼和浩特'}">selected="selected" </c:if>>呼和浩特</OPTION>
                                                <OPTION value='太原' <c:if test="${ item.cyf_place eq '太原'}">selected="selected" </c:if>>太原</OPTION>
                                                <OPTION value='合肥' <c:if test="${ item.cyf_place eq '合肥'}">selected="selected" </c:if>>合肥</OPTION>
                                                <OPTION value='南昌' <c:if test="${ item.cyf_place eq '南昌'}">selected="selected" </c:if>>南昌</OPTION>
                                                <OPTION value='武汉' <c:if test="${ item.cyf_place eq '武汉'}">selected="selected" </c:if>>武汉</OPTION>
                                                <OPTION value='长沙' <c:if test="${ item.cyf_place eq '长沙'}">selected="selected" </c:if>>长沙</OPTION>
                                                <OPTION value='郑州' <c:if test="${ item.cyf_place eq '郑州'}">selected="selected" </c:if>>郑州</OPTION>
                                                <OPTION value='其他广东城市' <c:if test="${ item.cyf_place eq '其他广东城市'}">selected="selected" </c:if>>其他广东城市</OPTION>
                                                <OPTION value='聊城' <c:if test="${ item.cyf_place eq '聊城'}">selected="selected" </c:if>>聊城</OPTION>
                                                <OPTION value='除聊城外其他城市'  <c:if test="${ item.cyf_place eq '除聊城外其他城市'}">selected="selected" </c:if>>除聊城外其他城市</OPTION>
                                                </SELECT>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control cyf_f" name="cyf_f"
                                                   value="${item.cyf_f}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <textarea name="cyf_why"   class="form-control"
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${item.cyf_why }</textarea>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control cyf_cf" name="cyf_cf"
                                                   value="${item.cyf_cf}" readonly>
                                        </td>

                                        <td  <c:if
                                                test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                            <%--<a onMouseOver="$(this).tooltip('show')"--%>
                                               <%--data-toggle="tooltip" title="下移" data-placement="top"--%>
                                               <%--style="padding:10px 5px"--%>
                                               <%--href="javascript:void(0)" class="fa fa-long-arrow-down btn"--%>
                                               <%--onclick="Custom.talbeMoveDown(this)"></a>--%>
                                            <%--<a href="javascript:void(0)" class="fa fa-long-arrow-up btn"--%>
                                               <%--onMouseOver="$(this).tooltip('show')"--%>
                                               <%--data-toggle="tooltip" title="上移" data-placement="top"--%>
                                               <%--style="padding:10px 5px"--%>
                                               <%--onclick="Custom.talbeMoveUP(this)"></a>--%>
                                            <a type="button" id="btn_deltr_cyf" class="btn closee"
                                               onMouseOver="$(this).tooltip('show')"
                                               data-toggle="tooltip" title="删行" data-placement="top"
                                               style="padding:10px 5px"
                                               href='javascript:void(0)' value="删行">
                                                <i class="fa fa-times"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        <table id="table1"
                               class="table table-striped table-bordered table-advance table-hover table-condensed">
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(小写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="cyf_fee" value="${app.cyf_fee }"  class="form-control cyf_fee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="cyf_fee_dx" value=""  class="form-control cyf_fee_dx"
                                           readOnly="readOnly"/>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">费用超标金额<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="cyf_cfee" value="${app.cyf_cfee }"  class="form-control cyf_cfee"
                                           readOnly/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">个人超限说明<span class="required"></span></label>
                                <div class="col-md-10">
                <textarea name="cyf_cremark"   class="form-control"
                        <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.cyf_cremark }</textarea>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6" hidden="">
                            <div class="form-group">
                                <label class="col-md-4 control-label">超限额审批<span class="required"><c:if test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw' }">*</c:if></span></label>
                                <div class="col-md-8">
                                    <div class="radio-list">
                                        <label class="radio-inline"> <input
                                                type="radio" name="cyf_agree" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.cyf_agree, '1')}"  > checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>同意
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="cyf_agree" value="2" class="disab"
                                        <c:if test="${fn:contains(app.cyf_agree, '2')}"> checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>不同意
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- END CONDENSED TABLE PORTLET-->
            </div>
        </div>

    </div>



</div>



    <script type="text/javascript">

        jQuery(document).ready(function () {
            $("#btn_deltr_cyf").live("click", function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 餐饮费
                countSums_cyf();

            });
        });

        $(".cyf_date").focus(function() {
            //var nowdate = new Date().pattern("yyyy-MM-dd");
            WdatePicker({dateFmt : "yyyy-MM-dd",isShowClear : false});
        });

        $("#btn_addtr_cyf").click(function() {

            var str_date = "";//日期

            str_date += "<input type='text' class='Wdate form-control cyf_date disab' name='cyf_date' value='' onfocus=\"WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})\">";

            var str_type ="";   //类别

            str_type+="<option value=''>请选择</option>" +
            "<OPTION value='北京'>北京</OPTION><OPTION value='上海'>上海</OPTION><OPTION value='广州'>广州</OPTION><OPTION value='深圳'>深圳</OPTION><OPTION value='青岛'>青岛</OPTION><OPTION value='苏州'>苏州</OPTION><OPTION value='南京'>南京</OPTION><OPTION value='无锡'>无锡</OPTION><OPTION value='宁波'>宁波</OPTION><OPTION value='温州'>温州</OPTION><OPTION value='杭州'>杭州</OPTION><OPTION value='济南'>济南</OPTION><OPTION value='厦门'>厦门</OPTION><OPTION value='福州'>福州</OPTION><OPTION value='南宁'>南宁</OPTION><OPTION value='海口'>海口</OPTION><OPTION value='三亚'>三亚</OPTION><OPTION value='重庆'>重庆</OPTION><OPTION value='成都'>成都</OPTION><OPTION value='兰州'>兰州</OPTION><OPTION value='银川'>银川</OPTION><OPTION value='西宁'>西宁</OPTION><OPTION value='拉萨'>拉萨</OPTION><OPTION value='乌鲁木齐'>乌鲁木齐</OPTION><OPTION value='昆明'>昆明</OPTION><OPTION value='贵阳'>贵阳</OPTION><OPTION value='天津'>天津</OPTION><OPTION value='石家庄'>石家庄</OPTION><OPTION value='沈阳'>沈阳</OPTION><OPTION value='大连'>大连</OPTION><OPTION value='长春'>长春</OPTION><OPTION value='哈尔滨'>哈尔滨</OPTION><OPTION value='呼和浩特'>呼和浩特</OPTION><OPTION value='太远'>太远</OPTION><OPTION value='合肥'>合肥</OPTION><OPTION value='南昌'>南昌</OPTION><OPTION value='武汉'>武汉</OPTION><OPTION value='长沙'>长沙</OPTION><OPTION value='郑州'>郑州</OPTION><OPTION value='其他广东城市'>其他广东城市</OPTION><OPTION value='聊城'>聊城</OPTION><OPTION value='除聊城外其他城市'>除聊城外其他城市</OPTION>"


            $(
                    "<tr><input type='text'  name='cyfchild'  value='' />" +
                    "<td>" +
                    "</td> " +

                    "<td >" +
                    str_date+
                    "</td> " +

                    "<td >" +
                    "<select   name='cyf_place' class='form-control' style='overflow-y:hidden' rows='1' >" +
                    str_type+
                    "</select >" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control cyf_f' name='cyf_f'>" +
                    "</td>" +

                    "<td>" +
                    "<textarea   name='cyf_why' class=' form-control '  rows='1'></textarea>" +
                    "</td> " +

                    "<td>" +
                    "<input type='text' class='form-control cyf_cf' readOnly name='cyf_cf'>" +
                    "</td>" +

                    " <td>"
                    //+ " <a class='fa fa-long-arrow-up btn ' style='padding:10px 5px' data-toggle='tooltip' title='上移' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveUP(this)'></a>"
                    //+ " <a class='fa fa-long-arrow-down btn' style='padding:10px 5px' data-toggle='tooltip' title='下移' data-placement='top' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveDown(this)'></a>"
                    + "	<a type='button' id='btn_deltr_cyf'"
                    + "	class='btn'  style='padding:10px 5px' href='javascript:void(0)'   value='删行'> "
                    + "	 <i class='fa fa-times'></i> "
                    + " </td>" + " </tr>")
                    .appendTo($("#cyftbl")); //在表格后面添加一行

        });


        function validateTbl_cyf(){
            //说明：array_cols是要验证的table的列号
            var tbl="cyftbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[1,2,3];    //表格中要验证必填的列号码
            if(rows==0){
                alert("请填写餐饮费信息！")
                return false;
            }else{//验证是否含有空数据
                var flag=true;
                for(i=0;i<rows;i++){
                    array_cols.forEach(function(e){//e为每个元素
                        var content_td = $("#"+tbl+" tbody tr").eq(i).find("td").eq(e).children().val();

                        var fnl = content_td.replace(/\s+/g,'');//过滤空格

                        if(fnl==""){
                            $("#"+tbl+" tbody tr").eq(i).find("td").eq(e).children().css("background", "yellow");
                            flag=false;
                            return;
                        }

                    });

                }
                if(!flag){
                    alert("列表信息中存在为空的内容！")
                }
                return flag;
            }
        }



    </script>




