<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box qtftbl" style="display:;">
    <div class="portlet-body" style="display:;">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">其他费信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <button type="button" class="btn " id="btn_addtr_qtf">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="qtftbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>日期</th>
                                <th>消费金额</th>
                                <th>科目</th>
                                <th>内容</th>
                                <th>超标准费用</th>
                                <th <c:if test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(qtfs) > 0 }">
                                <c:forEach items="${qtfs}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td >
                                            <input type="text" class=" form-control qtf_date disab" name="qtf_date"
                                                   value="<fmt:formatDate value="${item.qtf_date}" pattern="yyyy-MM-dd" type="date" dateStyle="full" />" <c:if
                                                    test="${flag eq 'view' || flag eq 'handle' }">
                                                   disabled='disabled' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control qtf_f" name="qtf_f"
                                                   value="${item.qtf_f}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <SELECT name="qtf_km"  class="form-control disab "
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>
                                                    row='1'>
                                                <OPTION value="">请选择</OPTION>
                                                <c:forEach items="${qtkms}" var="qt" varStatus="v">
                                                    <OPTION value='${qt.kstar}' <c:if test="${ qt.kstar eq item.qtf_km}">selected="selected" </c:if>>${qt.smemo}</OPTION>
                                                </c:forEach>
                                            </SELECT>
                                        </td>
                                        <td >
                                            <textarea name="qtf_content"   class="form-control"
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${item.qtf_content }</textarea>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control qtf_cf" name="qtf_cf"
                                                   value="${item.qtf_cf}" readonly>
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
                                            <a type="button" id="btn_deltr_qtf" class="btn closee"
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
                                    <input type="text" name="qtf_fee" value="${app.qtf_fee }"  class="form-control qtf_fee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="qtf_fee_dx" value=""  class="form-control qtf_fee_dx"
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
                                    <input type="text" name="qtf_cfee" value="${app.qtf_cfee }"  class="form-control qtf_cfee"
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
                <textarea name="qtf_cremark"   class="form-control"
                        <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.qtf_cremark }</textarea>
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
                                                type="radio" name="qtf_agree" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.qtf_agree, '1')}"  > checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>同意
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="qtf_agree" value="2" class="disab"
                                        <c:if test="${fn:contains(app.qtf_agree, '2')}"> checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>不同意
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

            $("#btn_deltr_qtf").live("click", function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 其他费
                countSums_qtf();

            });
        });

        $(".qtf_date").focus(function() {
            //var nowdate = new Date().pattern("yyyy-MM-dd");
            WdatePicker({dateFmt : "yyyy-MM-dd",isShowClear : false});
        });

        $("#btn_addtr_qtf").click(function() {

            var str_date = "";//日期

            str_date += "<input type='text' class='Wdate form-control qtf_date disab' name='qtf_date' value='' onfocus=\"WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})\">";

            var str_type ="";   //类别

            str_type+="<option value=''>请选择</option>"

            //"<OPTION value='001'>费用科目1</OPTION><OPTION value='002'>费用科目2</OPTION><OPTION value='003'>费用科目3</OPTION><OPTION value='004'>费用科目4</OPTION>"


            var compid = $("#m_fcompid").val();
            if(compid==""){
                alert("请先选择费用承担公司！")
            }
            var appda=$("#appda").val();
            $.getJSON("/agpay/agpay/json/getqtkmlist",{
                compid:compid,
                appda:appda
            },function(data){

                if(data!=undefined){

                    $.each(data.list, function(index, item){
                        str_type+="<OPTION value='"+item.KSTAR+"'>"+item.SMEMO+"</OPTION>";
                    });

                    $(
                            "<tr><input type='text'  name='qtfchild'  value='' />" +
                            "<td>" +
                            "</td> " +

                            "<td >" +
                            str_date+
                            "</td> " +

                            "<td>" +
                            "<input type='text' class='form-control qtf_f' name='qtf_f'>" +
                            "</td>" +

                            "<td >" +
                            "<select   name='qtf_km' class='form-control' style='overflow-y:hidden' rows='1' >" +
                            str_type+
                            "</select >" +
                            "</td>" +



                            "<td>" +
                            "<textarea   name='qtf_content' class=' form-control '  rows='1'></textarea>" +
                            "</td> " +

                            "<td>" +
                            "<input type='text' class='form-control qtf_cf' readonly name='qtf_cf'>" +
                            "</td>" +

                            " <td>"
                                //+ " <a class='fa fa-long-arrow-up btn ' style='padding:10px 5px' data-toggle='tooltip' title='上移' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveUP(this)'></a>"
                                //+ " <a class='fa fa-long-arrow-down btn' style='padding:10px 5px' data-toggle='tooltip' title='下移' data-placement='top' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveDown(this)'></a>"
                            + "	<a type='button' id='btn_deltr_qtf'"
                            + "	class='btn'  style='padding:10px 5px' href='javascript:void(0)'   value='删行'> "
                            + "	 <i class='fa fa-times'></i> "
                            + " </td>" + " </tr>")
                            .appendTo($("#qtftbl")); //在表格后面添加一行

                }
            });



        });

        //验证其他费用表格是否为空
        function validateTbl_qtf(){
            //说明：array_cols是要验证的table的列号
            var tbl="qtftbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[1,2,3];    //表格中要验证必填的列号码
            if(rows==0){
                alert("请填写其他费信息！")
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




