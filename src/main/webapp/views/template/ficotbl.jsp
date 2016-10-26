<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box ficotbl" style="display:;">
    <div class="portlet-body" style="display:;">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">财务审批信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" style="display:none">
                        <button type="button" class="btn " id="btn_addtr_fico">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="ficotbl">
                            <thead>
                            <tr>
                                <th></th>
                                <th>费用科目</th>
                                <th>科目编码</th>
                                <th>报销金额</th>
                                <th>扣款金额</th>
                                <th>实报金额</th>
                                <th>扣款说明</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${fn:length(ficos) > 0 }">
                                <c:forEach items="${ficos}" var="item" varStatus="vstt">
                                    <tr>
                                        <td>${vstt.index+1 }</td>
                                        <td >
                                            <input type="text" class=" form-control fico_kmnm disab" name="fico_kmnm"
                                                   value="${item.fico_kmnm}" readonly>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control fico_km" name="fico_km"
                                                                   value="${item.fico_km}"  readonly='readonly'>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control fico_bxfee" name="fico_bxfee"
                                                   value="${item.fico_bxfee}" readonly='readonly'>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control fico_divfee" name="fico_divfee"
                                                   value="${item.fico_divfee}" <c:if  test="${taskDefinitionKey ne 'accout' }">  readonly='readonly' </c:if>>
                                        </td>
                                        <td >
                                            <input type="text" class="form-control fico_actfee" name="fico_actfee"
                                                   value="${item.fico_actfee}" readonly='readonly'>
                                        </td>

                                        <td >
                                            <textarea   name='fico_remark' class=' form-control ' rows="1"  <c:if  test="${taskDefinitionKey ne 'accout' }">  readonly='readonly' </c:if> >${item.fico_remark}</textarea>

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
                                <label class="control-label col-md-4">合计<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_reqmoney" value="${app.m_reqmoney }"  class="form-control m_reqmoney"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">实报金额<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_actmoney" value="${app.m_actmoney }"  class="form-control m_actmoney"
                                           readOnly="readOnly"/>
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
            //初始化行数据
            initDatas();

            //计算合计
            sums();

            $("input[name='fico_divfee']").blur(function(){
                if(isNaN($(this).val())){
                    alert("请输入正确的数字格式");
                    $(this).focus();
                }else{
                    var cur_v = $(this).val();
                    $(this).val(Number(cur_v).toFixed(2));
                    var all_v = $(this).parent().prev().children().val();
                    var result=Number(all_v)-Number(cur_v);
                    $(this).parent().next().children().val(result.toFixed(2));
                }

                sums();
            });


        });

        //初始化报销数据
        function initDatas(){
            var rows = $("#ficotbl tbody tr").size();
            for(i=0;i<rows;i++){
                var allf = $("#ficotbl tbody tr").eq(i).find("td").eq(3).children().val();
                var kkf = $("#ficotbl tbody tr").eq(i).find("td").eq(4).children().val();

                var actf = Number(allf)-Number(kkf);
                $("#ficotbl tbody tr").eq(i).find("td").eq(5).children().val(actf.toFixed(2));

            }
        }

        //计算报销费用合计
        function sums(){

            var rows = $("#ficotbl tbody tr").size();

            var allt_sums=0;
            var act_sums=0;

            for(i=0;i<rows;i++){
                var allf = $("#ficotbl tbody tr").eq(i).find("td").eq(3).children().val();
                var actf = $("#ficotbl tbody tr").eq(i).find("td").eq(5).children().val();
                allt_sums+=Number(allf);
                act_sums+=Number(actf);
            }

            $("input[name='m_reqmoney']").val(allt_sums.toFixed(2));
            $("input[name='m_actmoney']").val(act_sums.toFixed(2));
        }

    </script>




