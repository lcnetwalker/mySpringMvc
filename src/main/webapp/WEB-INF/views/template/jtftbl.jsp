<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box jtftbl">
    <div class="portlet-body" >

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">交通费信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <button type="button" class="btn " id="btn_addtr_jtf">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" >
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="jtftbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>日期</th>
                                <th>出发地</th>
                                <th>到达地</th>
                                <th>具体地点</th>
                                <th>类别</th>
                                <th>席别</th>
                                <th>交通金额</th>
                                <th>事由</th>
                                <th>超标准费用</th>
                                <th <c:if test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(jtfs) > 0 }">
                                <c:forEach items="${jtfs}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td >
                                            <input type="text" class=" form-control jtf_date disab" name="jtf_date"
                                                   value="<fmt:formatDate value="${item.jtf_date}" pattern="yyyy-MM-dd" type="date" dateStyle="full" />" <c:if
                                                    test="${flag eq 'view' || flag eq 'handle' }">
                                                   disabled='disabled' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control jtf_splace" name="jtf_splace"
                                                                   value="${item.jtf_splace}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control jtf_eplace" name="jtf_eplace"
                                                   value="${item.jtf_eplace}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control jtf_dplace" name="jtf_dplace"
                                                   value="${item.jtf_dplace}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <select name="jtf_type"  class="form-control disab "
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>
                                                    row='1'>
                                                <option value="">请选择</option>
                                                <option value="1" <c:if test="${ item.jtf_type eq '1'}">selected="selected" </c:if>>飞机</option>
                                                <option value="2" <c:if test="${ item.jtf_type eq '2'}">selected="selected" </c:if>>动车</option>
                                                <option value="3" <c:if test="${ item.jtf_type eq '3'}">selected="selected" </c:if>>其他火车(400公里内)</option>
                                                <option value="4" <c:if test="${ item.jtf_type eq '4'}">selected="selected" </c:if>>其他火车(超过400公里)</option>
                                                <option value="5" <c:if test="${ item.jtf_type eq '5'}">selected="selected" </c:if>>汽车</option>
                                                <option value="6" <c:if test="${ item.jtf_type eq '6'}">selected="selected" </c:if>>轮船</option>
                                            </select>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control jtf_xb" name="jtf_xb"
                                                   value="${item.jtf_xb}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control jtf_f" name="jtf_f"
                                                   value="${item.jtf_f}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        </td>

                                        <td >
                                            <textarea name="jtf_why"   class="form-control"
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${item.jtf_why }</textarea>
                                        </td>

                                        <td >
                                            <input type="text" class="form-control jtf_cf" name="jtf_cf"
                                                   value="${item.jtf_cf}" readonly='readonly'>
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
                                            <a type="button" id="btn_deltr_jtf" class="btn closee"
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
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(小写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="jtf_fee" value="${app.jtf_fee }"  class="form-control jtf_fee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="jtf_fee_dx" value=""  class="form-control jtf_fee_dx"
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
                                    <input type="text" name="jtf_cfee" value="${app.jtf_cfee }"  class="form-control jtf_cfee"
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
                <textarea name="jtf_cremark"   class="form-control"
                        <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.jtf_cremark }</textarea>
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
                                                type="radio" name="jtf_agree" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.jtf_agree, '1')}"  > checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>同意
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="jtf_agree" value="2" class="disab"
                                        <c:if test="${fn:contains(app.jtf_agree, '2')}"> checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>不同意
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
            $("#btn_deltr_jtf").live("click", function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 交通费
                countSums_jtf();

            });
        });

        $(".jtf_date").focus(function() {
            //var nowdate = new Date().pattern("yyyy-MM-dd");
            WdatePicker({dateFmt : "yyyy-MM-dd",isShowClear : false});
        });

        $("#btn_addtr_jtf").click(function() {

            var str_date = "";//日期

            str_date += "<input type='text' class='Wdate form-control jtf_date disab' name='jtf_date' value='' onfocus=\"WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})\">";

            var str_type ="";   //类别

            str_type+="<option value=''>请选择</option>" +
            "<option value='1' >飞机</option>" +
            "<option value='2' >动车</option>" +
            "<option value='3' >其他火车(400公里内)</option>"+
            "<option value='4' >其他火车(超过400公里)</option>"+
            "<option value='5' >汽车</option>"+
            "<option value='6' >轮船</option>"

            $(
                    "<tr><input type='text'  name='jtfchild'  value='' />" +
                    "<td>" +
                    "</td> " +

                    "<td >" +
                    str_date+
                    "</td> " +

                    "<td >" +
                    "<input type='text' class='form-control jtf_splace' name='jtf_splace'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control jtf_eplace' name='jtf_eplace'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control jtf_dplace' name='jtf_dplace'>" +
                    "</td>" +

                    "<td>" +
                    "<select   name='jtf_type' class='form-control' style='overflow-y:hidden' rows='1' >" +
                    str_type+
                    "</select >" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control jtf_xb' name='jtf_xb'>" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='form-control jtf_f' name='jtf_f'>" +
                    "</td>" +

                    "<td>" +
                    "<textarea   name='jtf_why' class=' form-control '  rows='1'></textarea>" +
                    "</td> " +

                    "<td>" +
                    "<input type='text' class='form-control jtf_cf'readonly name='jtf_cf'>" +
                    "</td>" +

                    " <td>"
                    //+ " <a class='fa fa-long-arrow-up btn ' style='padding:10px 5px' data-toggle='tooltip' title='上移' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveUP(this)'></a>"
                    //+ " <a class='fa fa-long-arrow-down btn' style='padding:10px 5px' data-toggle='tooltip' title='下移' data-placement='top' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveDown(this)'></a>"
                    + "	<a type='button' id='btn_deltr_jtf'"
                    + "	class='btn'  style='padding:10px 5px' href='javascript:void(0)'   value='删行'> "
                    + "	 <i class='fa fa-times'></i> "
                    + " </td>" + " </tr>")
                    .appendTo($("#jtftbl")); //在表格后面添加一行

        });

        function validateTbl_jtf(){
            //说明：array_cols是要验证的table的列号
            var tbl="jtftbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[1,2,3,4,5,6,7];    //表格中要验证必填的列号码
            if(rows==0){
                alert("请填写交通费信息！")
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




