<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa  fa-wrench"></i>申请信息
        </div>
        <div class="tools">
            <a class="collapse" href="javascript:;"></a>
        </div>

    </div>
    <div class="portlet-body" style="display:;">


        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人</label>

                    <div class="col-md-8">
                        <input type="text" class="form-control m_fpostid" name="m_fpostid"
                               id="m_fpostid" value="${app.m_fpostid}" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }">
                        readonly='readonly' </c:if>>
                        <input type="hidden" class="form-control m_fnm" name="m_fnm"
                               id="m_fnm" value="${app.m_fnm}" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }">
                        readonly='readonly' </c:if>>

                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人ITCODE</label>

                    <div class="col-md-8">
                        <input type="text" class="form-control m_fcode" name="m_fcode"
                               id="m_fcode" value="${app.m_fcode}" readonly='readonly'>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人员工编号</label>

                    <div class="col-md-8">

                        <input type="text" class="form-control m_fpernr" name="m_fpernr"
                               id="m_fpernr" value="${app.m_fpernr}" readonly='readonly'>

                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人所在岗位</label>

                    <div class="col-md-8">
                        <input type="text" class="form-control m_fpostnm" name="m_fpostnm"
                               id="m_fpostnm" value="${app.m_fpostnm}" readonly='readonly'>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人手机号</label>

                    <div class="col-md-8">

                        <input type="text" class="form-control m_ftel" name="m_ftel"
                               id="m_ftel" value="${app.m_ftel}" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }">
                        readonly='readonly' </c:if>>

                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">交办人财务编号</label>

                    <div class="col-md-8">

                        <input type="text" class="form-control m_dfinum" name="m_dfinum"
                               id="m_dfinum" value="${app.m_dfinum}" >

                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div  class="col-md-6">
                <div class="form-group">
                    <label class="control-label col-md-4">预算类型<span class="required"><c:if test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw'}">*</c:if></span></label>
                    <div class="col-md-8">
                        <div class="radio-list">
                            <label class="radio-inline" id="m_butypeone"> <input
                                    type="radio" name="m_butype" value="1" class=" disab"
                                <c:if test="${app.m_butype eq '1'}"  > checked</c:if> <c:if test="${flag eq 'handle' || flag eq 'view' }"> disabled="disabled" </c:if>>通用
                            </label>
                            <label class="radio-inline"> <input
                                    type="radio" name="m_butype" value="2" class="disab"
                                <c:if test="${app.m_butype eq '2'}"> checked</c:if> <c:if test="${flag eq 'handle' || flag eq 'view' }"> disabled="disabled" </c:if>>内部订单
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 disordernum" style="display: <c:if test="${app.m_butype eq '1'}"  > none</c:if>">
            <div class="form-group">
                <label class="col-md-4 control-label">内部订单号</label>
                <div class="col-md-8">
                    <c:if test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw' }">
                        <select name="m_ordernum"  id="m_ordernum"
                                class="select2-container form-control select2me input-sm  m_ordernum  disab"   >
                            <option value="">请选择</option>
                        </select>
                        <input  type="hidden" name="m_ordernum_t" id="m_ordernum_t" value="${app.m_ordernum }" />
                        <input  type="hidden" name="m_orderval" id="m_orderval" value="${app.m_orderval }" />
                    </c:if>
                    <c:if test="${flag ne 'add' && flag ne 'edit' && flag ne 'resubmit' && flag ne 'afterWithdraw' }">
                        <input  type="hidden" name="m_ordernum" class="form-control" id="m_ordernum" value="${app.m_ordernum }" />
                        <input  type="hidden" name="m_orderval" id="m_orderval" value="${app.m_orderval }" />
                        <input  type="text" name="m_ordernumval" class="form-control" id="m_ordernumval"  readonly value="${app.m_ordernum }${app.m_orderval }" />

                    </c:if>
                </div>
            </div>
        </div>

        <div class="col-md-6 dism_costid" style="display: <c:if test="${app.m_butype eq '2'}"  > none</c:if>">
        <div class="form-group">
            <label class="col-md-4 control-label">交办人成本中心</label>

            <div class="col-md-8">

                <c:if test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw' }">
                    <select name="m_costid"  id="m_costid"  <c:if test="${flag eq 'view' || flag eq 'handle' ne  taskDefinitionKey eq 'afk' }"> disabled='disabled' </c:if>
                    class="select2-container form-control select2me input-sm    disab"   >
                    <option value="">请选择</option>
                    </select>
                    <input  type="hidden" name="m_costid_t" id="m_costid_t" value="${app.m_costid}" />
                    <input  type="hidden" name="m_costnm" id="m_costnm" value="${app.m_costnm }" />
                </c:if>

                <c:if test="${flag ne 'add' && flag ne 'edit' && flag ne 'resubmit' && flag ne 'afterWithdraw' }">
                    <input type="hidden" name="m_costid" id="m_costid" value="${app.m_costid }">
                    <input  type="text" name="m_costnm" class="form-control " readonly id="m_costnm" value="${app.m_costnm }" />
                </c:if>
            </div>

        </div>
    </div>

</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="col-md-4 control-label">费用承担公司</label>

            <div class="col-md-8">
                <c:if test="${flag ne 'view' && flag ne 'handle' }">
                    <select name="m_fcompid" id="m_fcompid" <c:if
                        test="${flag eq 'view' || flag eq 'handle' }"> disabled='disabled' </c:if>
                    class="select2-container form-control select2me input-sm form-control  ubukrss disab">
                    </select>
                    <input type="hidden" name="m_fcompid_b" id="m_fcompid_b"
                           value="${app.m_fcompid }"/>
                    <input type="hidden" name="m_fcompnm"
                           id="m_fcompnm" value="${app.m_fcompnm}">
                </c:if>

                <c:if test="${flag eq 'view' || flag eq 'handle' }">

                    <input type="hidden" name="m_fcompid" id="m_fcompid"
                           value="${app.m_fcompid }"/>
                    <input type="text" name="m_fcompnm" class="form-control"
                    <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly </c:if>
                    id="m_fcompnm" value="${app.m_fcompnm}">
                </c:if>




            </div>

        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label class="col-md-4 control-label">预算内/外<span class="required"><c:if
                    test="${flag eq 'add' || flag eq 'edit' || flag eq 'resubmit' || flag eq 'afterWithdraw' }">*</c:if></span></label>

            <div class="col-md-8">
                <div class="radio-list">
                    <label class="radio-inline"> <input
                            type="radio" name="m_frepaytp" value="1" class=" disab"
                        <c:if test="${fn:contains(app.m_frepaytp, '1')}"> checked</c:if>
                        <c:if test="${flag eq 'view' || flag eq 'handle' }">
                            disabled="disabled" </c:if>>预算内
                    </label>
                    <label class="radio-inline"> <input
                            type="radio" name="m_frepaytp" value="2" class="disab"
                        <c:if test="${fn:contains(app.m_frepaytp, '2')}"> checked</c:if>
                        <c:if test="${flag eq 'view' || flag eq 'handle' }">
                            disabled="disabled" </c:if>>预算外
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label class="control-label col-md-2">报销类别<span
                        class="required">*</span></label>

                <div class="checkbox-list col-md-10">

                    <label class="checkbox-inline">
                        <input class="disab" type="checkbox" name="m_retp" value="1" onclick="ckdck(this)"
                        <c:if test="${fn:contains(app.m_retp, '1')}"> checked</c:if>
                        <c:if test="${flag eq 'view' || flag eq 'handle' }">
                            disabled="disabled"</c:if>>通讯费
                    </label> <label class="checkbox-inline"> <input class="disab"
                                                                    type="checkbox" name="m_retp" value="2" onclick="ckdck(this)"
                    <c:if test="${fn:contains(app.m_retp, '2')}"> checked</c:if>
                    <c:if test="${flag eq 'view' || flag eq 'handle' }">
                        disabled="disabled"</c:if>>交通费
                </label> <label class="checkbox-inline"> <input class="disab"
                                                                type="checkbox" name="m_retp" value="3" onclick="ckdck(this)"
                    <c:if test="${fn:contains(app.m_retp, '3')}"> checked</c:if>
                    <c:if test="${flag eq 'view' || flag eq 'handle' }">
                        disabled="disabled"</c:if>>业务招待费
                </label> <label class="checkbox-inline"> <input class="disab"
                                                                type="checkbox" name="m_retp" value="4" onclick="ckdck(this)"
                    <c:if test="${fn:contains(app.m_retp, '4')}"> checked</c:if>
                    <c:if test="${flag eq 'view' || flag eq 'handle' }">
                        disabled="disabled"</c:if>>餐饮费
                </label> <label class="checkbox-inline"><input class="disab"
                                                               type="checkbox" name="m_retp" value="5" onclick="ckdck(this)"
                    <c:if test="${fn:contains(app.m_retp, '5')}"> checked</c:if>
                    <c:if test="${flag eq 'view' || flag eq 'handle' }">
                        disabled="disabled"</c:if>>其他费用
                </label>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="col-md-2 control-label">备注</label>

            <div class="col-md-10">

                <textarea name="m_remark"   class="form-control" rows="3"
                <c:if test="${flag eq 'view' || flag eq 'handle' }"> readonly</c:if>>${app.m_remark }</textarea>
            </div>

        </div>
    </div>
</div>


<%@ include file="fkxxtbl.jsp" %>
<%--备用金--%>
<%@ include file="byjtbl.jsp" %>




<div class="portlet-body" style="display:;">
    <div class="form-body">
        <ul class="nav nav-pills ull">
            <li style="display: none" class="lii txftbl_f  <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if>">
                <a class="da" href="#tab_2_1" data-toggle="tab">通讯费 </a>
            </li>
            <li style="display: none" class="lii jtftbl_f   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if>">
                <a class="da" href="#tab_2_2" data-toggle="tab">交通费 </a>
            </li>
            <li style="display: none" class="lii zdftbl_f  <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if>">
                <a class="da" href="#tab_2_3" data-toggle="tab">业务招待费 </a>
            </li>
            <li style="display: none" class="lii cyftbl_f  <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if>">
                <a class="da" href="#tab_2_4" data-toggle="tab">餐饮费 </a>
            </li>
            <li style="display: none" class="lii qtftbl_f  <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if>">
                <a class="da" href="#tab_2_5" data-toggle="tab">其他费用 </a>
            </li>
            <li  class="lii ficotbl_f  <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'>active</c:if>">
                <a class="da" href="#tab_2_6" data-toggle="tab">财务审批信息 </a>
            </li>
        </ul>

        <div class="tabd tab-content">
            <div   class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if> " id="tab_2_1">
                <%@ include file="txftbl.jsp" %>
            </div>
            <div  class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if> " id="tab_2_2">
                <%@ include file="jtftbl.jsp" %>
            </div>
            <div  class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if> " id="tab_2_3">
                <%@ include file="zdftbl.jsp" %>
            </div>
            <div  class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if> " id="tab_2_4">
                <%@ include file="cyftbl.jsp" %>
            </div>
            <div  class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'></c:if> " id="tab_2_5">
                <%@ include file="qtftbl.jsp" %>
            </div>
            <div  class="tabdd tab-pane fade   <c:if test='${flag eq "view" or flag eq "add" or flag eq "edit" or flag eq "resubmit" or flag eq "afterWithdraw" or flag eq "handle" }'>active in</c:if> " id="tab_2_6">
                <%@ include file="ficotbl.jsp" %>
            </div>
        </div>

    </div>
</div>


<%@ include file="ysxxtbl.jsp" %>
<%--<%@ include file="txftbl.jsp" %>--%>
<%--<%@ include file="jtftbl.jsp" %>--%>
<%--<%@ include file="zdftbl.jsp" %>--%>
<%--<%@ include file="cyftbl.jsp" %>--%>
<%--<%@ include file="qtftbl.jsp" %>--%>

</div>
</div>



    <script type="text/javascript">

        jQuery(document).ready(function () {

        });

        jQuery(document).ready(function () {

        });





    </script>




