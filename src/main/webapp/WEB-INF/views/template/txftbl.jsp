<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box txftbl" style="display:;">
    <div class="portlet-body" style="display:;">
        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">通讯费信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <button type="button" class="btn " id="btn_addtr_txf">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="txftbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>月份</th>
                                <th>通讯费用</th>
                                <th>超标准费用</th>
                                <th <c:if test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if>>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(txfs) > 0 }">
                                <c:forEach items="${txfs}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td class="col-md-4">
                                            <select name="txf_month"  class="form-control disab "
                                                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>
                                                    row='1'>
                                                <option value="">请选择</option>
                                                <option value="1" <c:if test="${ item.txf_month eq '1'}">selected="selected" </c:if>>一月</option>
                                                <option value="2" <c:if test="${ item.txf_month eq '2'}">selected="selected" </c:if>>二月</option>
                                                <option value="3" <c:if test="${ item.txf_month eq '3'}">selected="selected" </c:if>>三月</option>
                                                <option value="4" <c:if test="${ item.txf_month eq '4'}">selected="selected" </c:if>>四月</option>
                                                <option value="5" <c:if test="${ item.txf_month eq '5'}">selected="selected" </c:if>>五月</option>
                                                <option value="6" <c:if test="${ item.txf_month eq '6'}">selected="selected" </c:if>>六月</option>
                                                <option value="7" <c:if test="${ item.txf_month eq '7'}">selected="selected" </c:if>>七月</option>
                                                <option value="8" <c:if test="${ item.txf_month eq '8'}">selected="selected" </c:if>>八月</option>
                                                <option value="9" <c:if test="${ item.txf_month eq '9'}">selected="selected" </c:if>>九月</option>
                                                <option value="10" <c:if test="${ item.txf_month eq '10'}">selected="selected" </c:if>>十月</option>
                                                <option value="11" <c:if test="${ item.txf_month eq '11'}">selected="selected" </c:if>>十一月</option>
                                                <option value="12" <c:if test="${ item.txf_month eq '12'}">selected="selected" </c:if>>十二月</option>

                                            </select>
                                        </td>
                                        <td class="col-md-4">
                                            <input type="text" class="form-control txf_f" name="txf_f"
                                                   value="${item.txf_f}" <c:if  test="${flag eq 'view' || flag eq 'handle' }">  readonly='readonly' </c:if>>
                                        <td class="col-md-4"><textarea name="txf_cf"
                                                                       class=" form-control  txf_cf" readOnly
                                                                       rows="1">${ item.txf_cf}</textarea></td>

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
                                            <a type="button"  class="btn closee btn_deltr_txf"
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
                        <%--<table id="table1"--%>
                               <%--class="table table-striped table-bordered table-advance table-hover table-condensed">--%>
                        <%--</table>--%>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(小写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="txf_fee" value="${app.txf_fee }"  class="form-control txf_fee"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">总计(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="txf_fee_dx" value=""  class="form-control "
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
                                    <input type="text" name="txf_cfee" value="${app.txf_cfee }"  class="form-control txf_cfee"
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
                <textarea name="txf_cremark"   class="form-control"
                        <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.txf_cremark }</textarea>
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
                                                type="radio" name="txf_agree" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.txf_agree, '1')}"  > checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>同意
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="txf_agree" value="2" class="disab"
                                        <c:if test="${fn:contains(app.txf_agree, '2')}"> checked</c:if> <c:if test="${flag eq 'view' || flag eq 'handle' }"> disabled="disabled" </c:if>>不同意
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
            $(".btn_deltr_txf").live("click", function(){
                //$(".btn_deltr_txf").click(function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 通讯费
                countSums_txf();

            });
        });

        $("#btn_addtr_txf").click(function() {

            var str = "";

            str += "<option value='1' >一月</option>";
            str += "<option value='2' >二月</option>";
            str += "<option value='3' >三月</option>";
            str += "<option value='4' >四月</option>";
            str += "<option value='5' >五月</option>";
            str += "<option value='6' >六月</option>";
            str += "<option value='7' >七月</option>";
            str += "<option value='8' >八月</option>";
            str += "<option value='9' >九月</option>";
            str += "<option value='10' >十月</option>";
            str += "<option value='11' >十一月</option>";
            str += "<option value='12' >十二月</option>";

            $(
                    "<tr><input type='text'  name='txfchild'  value='' />"
                    + "<td> </td> "
                    + "<td >"
                    + "<select   name='txf_month' "
                    + "	class='form-control' style='overflow-y:hidden' rows='1' >"
                    + "   <option value=''>请选择</option>"
                    + str
                    + "	</select >"
                    + "</td> "+


                    "<td>" +
                    "<input type='text' class='form-control txf_f' name='txf_f'>" +
                    "</td>" +

                    "<td><textarea   name='txf_cf' class=' form-control txf_cf'  rows='1' readOnly >"

                    + "</textarea></td> "
                    + " <td>"
                    //+ " <a class='fa fa-long-arrow-up btn ' style='padding:10px 5px' data-toggle='tooltip' title='上移' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveUP(this)'></a>"
                    //+ " <a class='fa fa-long-arrow-down btn' style='padding:10px 5px' data-toggle='tooltip' title='下移' data-placement='top' onMouseOver='$(this).tooltip(\"show\")' href='javascript:void(0)' onclick='Custom.talbeMoveDown(this)'></a>"
                    + "	<a type='button' "
                    + "	class='btn btn_deltr_txf'  style='padding:10px 5px' href='javascript:void(0)'   value='删行'> "
                    + "	 <i class='fa fa-times'></i> "
                    + " </td>" + " </tr>")
                    .appendTo($("#txftbl")); //在表格后面添加一行

        });

        function validateTbl_txf(){
            //说明：array_cols是要验证的table的列号
            var tbl="txftbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[1,2];    //表格中要验证必填的列号码
            if(rows==0){
                alert("请填写通讯费信息！")
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




