<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box fkxxtbl" >
    <div class="portlet-body">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">付款信息</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" >




                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">付款金额(小写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_paymoney_r" value="${app.m_actmoney }"  class="form-control m_paymoney_r"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">付款金额(大写)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="fkxx_fee_dx" value=""  class="form-control fkxx_fee_dx"
                                           readOnly="readOnly"/>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">汇率<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_payrate" value="${app.m_payrate }"  class="form-control m_payrate"
                                            <c:if test="${taskDefinitionKey ne 'payment' }">  readOnly="readOnly" </c:if>   />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">汇款金额(人民币)<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_paymoney" value="${app.m_paymoney }"  class="form-control m_paymoney"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">结算方式<span class="required"><c:if test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw' }">*</c:if></span></label>
                                <div class="col-md-8">
                                    <div class="radio-list">
                                        <label class="radio-inline"> <input
                                                type="radio" name="m_paytp" value="1" class=" disab"
                                        <c:if test="${fn:contains(app.m_paytp, '1')}"  > checked</c:if> <c:if test="${taskDefinitionKey ne 'payment' }"> disabled="disabled" </c:if>>汇款
                                        </label>
                                        <label class="radio-inline"> <input
                                                type="radio" name="m_paytp" value="2" class="disab"
                                        <c:if test="${fn:contains(app.m_paytp, '2')}"> checked</c:if> <c:if test="${taskDefinitionKey ne 'payment' }"> disabled="disabled" </c:if>>现金
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6"  <c:if test="${ taskDefinitionKey ne 'payment' }">  style="display:none" </c:if>>
                            <div class="form-group">
                                <label class="control-label col-md-4">个人银行账户<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_account" value="${app.m_account }"  class="form-control m_account"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" <c:if test="${ taskDefinitionKey ne 'payment' }">  style="display:none" </c:if>>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">开户行<span class="required"></span></label>
                                <div class="col-md-8">
                                    <input type="text" name="m_acbank" value="${app.m_acbank }"  class="form-control m_acbank"
                                           readOnly="readOnly"/>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">备注<span class="required"></span></label>
                                <div class="col-md-10">
                    <textarea name="m_remark1"   class="form-control"
                            <c:if test="${taskDefinitionKey ne 'payment' }">  readOnly="readOnly" </c:if>>${app.m_remark1 }</textarea>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2">付款情况通知说明<span class="required"></span></label>
                                <div class="col-md-10">
                                    <label class="checkbox-inline disab"> <input
                                            type="checkbox" name="m_paystate" value="1"
                                    <c:if test="${fn:contains(app.m_paystate, '1')}"> checked</c:if><c:if test="${taskDefinitionKey ne 'payment' }"> disabled="disabled"</c:if>>已付款（出纳付款通知环节才能勾选，不选择无法提交）
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>





</div>



    <script type="text/javascript">

        jQuery(document).ready(function () {
            $("#btn_deltr_fkxx").live("click", function(){
                if(confirm("确认删除吗?")) {
                    $(this).parent().parent().remove();
                }
                //计算合计 交通费
                countSums_fkxx();

            });
        });

        //获取银行账户信息  出纳环节
        <%--function getbankinfo(){--%>

            <%--var taskDefinitionKey = $("#taskDefinitionKey").val();--%>
            <%--var isEnd = $("#isEnd").val();--%>
            <%--if("payment"==taskDefinitionKey){--%>
                <%--$.getJSON("${ctx}/agpay/agpay/json/getbankinfo", {--%>
                    <%--pernr: "${app.m_fpernr}",--%>
                    <%--appda:"${app.appda}"--%>
                <%--}, function (data) {--%>
                    <%--if (typeof(data) != "undefined") {--%>
                        <%--$("input[name='m_acbank']").val(data.banka);//银行名称--%>
                        <%--$("input[name='m_account']").val(data.bankn);//账号--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>


        <%--}--%>

    </script>




