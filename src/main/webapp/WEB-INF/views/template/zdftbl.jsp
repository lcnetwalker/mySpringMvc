<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box zdftbl" style="display:;">
    <div class="portlet-body" style="display:;">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">业务招待费信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <button type="button" class="btn " id="btn_addtr_zdf">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="zdftbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>招待日期</th>
                                <th>出席员工姓名</th>
                                <th>客户</th>
                                <th>招待地点</th>
                                <th>用餐人数</th>
                                <th>消费金额</th>
                                <th>超标准金额</th>
                                <th>事由</th>
                                <th>备注</th>
                                <th <c:if test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(zdfs) > 0 }">
                                <c:forEach items="${zdfs}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td >
                                            <input type="text" class=" form-control zdf_date disab" name="zdf_date"
                                                   value="<fmt:formatDate value="${item.zdf_date}" pattern="yyyy-MM-dd" type="date" dateStyle="full" />" <c:if
                                                    test="${flag eq 'view' || flag eq 'handle' }">
                                                   disabled='disabled' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control zdf_nms" name="zdf_nms"
                                                                   value="${item.zdf_nms}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control zdf_guests" name="zdf_guests"
                                                   value="${item.zdf_guests}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control zdf_place" name="zdf_place"
                                                   value="${item.zdf_place}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control zdf_sums" name="zdf_sums"
                                                   value="${item.zdf_sums}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control zdf_f" name="zdf_f"
                                                   value="${item.zdf_f}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control zdf_cf" name="zdf_cf"
                                                   value="${item.zdf_cf}"  readonly>
                                        </td>

                                        <td >
                                            <textarea name="zdf_why"   class="form-control"
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${item.zdf_why }</textarea>
                                        </td>

                                        <td >
                                            <textarea name="zdf_rmk"   class="form-control"
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${item.zdf_rmk }</textarea>
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
                                            <a type="button" id="btn_deltr_zdf" class="btn closee"
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
                                    <input type="text" name="zdf_fee" value="${app.zdf_fee }"  class="form-control zdf_fee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="zdf_fee_dx" value=""  class="form-control"
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
                                    <input type="text" name="zdf_cfee" value="${app.zdf_cfee }"  class="form-control zdf_cfee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">个人超限说明<span class="required"></span></label>
                                <div class="col-md-10">
                <textarea name="zdf_cremark"   class="form-control"
                        <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.zdf_cremark }</textarea>
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
                                                type="radio" name="zdf_agree" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.zdf_agree, '1')}"  > checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>同意
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="zdf_agree" value="2" class="disab"
                                        <c:if test="${fn:contains(app.zdf_agree, '2')}"> checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>不同意
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

            $("#btn_deltr_zdf").live("click", function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 招待费
                countSums_zdf();

            });
        });

        $(".zdf_date").focus(function() {
            //var nowdate = new Date().pattern("yyyy-MM-dd");
            WdatePicker({dateFmt : "yyyy-MM-dd",isShowClear : false});
        });

        $("#btn_addtr_zdf").click(function() {

            var str_date = "";//日期

            str_date += "<input type='text' class='Wdate form-control zdf_date disab' name='zdf_date' value='' onfocus=\"WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})\">";


            $(
                    "<tr><input type='text'  name='zdfchild'  value='' />" +
                    "<td>" +
                    "</td> " +

                    "<td >" +
                    str_date+
                    "</td> " +

                    "<td >" +
                    "<input type='text' class='form-control zdf_nms' name='zdf_nms'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control zdf_guests' name='zdf_guests'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control zdf_place' name='zdf_place'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control zdf_sums' name='zdf_sums'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control zdf_f' name='zdf_f'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control zdf_cf' readonly name='zdf_cf'>" +
                    "</td>" +

                    "<td>" +
                    "<textarea   name='zdf_why' class=' form-control '  rows='1'></textarea>" +
                    "</td> " +

                    "<td>" +
                    "<textarea   name='zdf_rmk' class=' form-control '  rows='1'></textarea>" +
                    "</td> " +


                    " <td>"
                    //+ " <a class='fa fa-long-arrow-up btn ' style='padding:10px 5px' data-toggle='tooltip' title='上移' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveUP(this)'></a>"
                    //+ " <a class='fa fa-long-arrow-down btn' style='padding:10px 5px' data-toggle='tooltip' title='下移' data-placement='top' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveDown(this)'></a>"
                    + "	<a type='button' id='btn_deltr_zdf'"
                    + "	class='btn'  style='padding:10px 5px' href='javascript:void(0)'   value='删行'> "
                    + "	 <i class='fa fa-times'></i> "
                    + " </td>" + " </tr>")
                    .appendTo($("#zdftbl")); //在表格后面添加一行

        });

        function validateTbl_zdf(){
            //说明：array_cols是要验证的table的列号
            var tbl="zdftbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[1,2,3,4,5,6];    //表格中要验证必填的列号码
            if(rows==0){
                alert("请填写招待费信息！")
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




