<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box byjtbl">
    <div class="portlet-body">

        <div class="row">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa  fa-tag">未清备用金</i>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                    <div class="actions closee" <c:if
                            test="${flag eq 'view' || flag eq 'handle' }"> style="display:none" </c:if> >
                        <%--<button type="button" class="btn " id="btn_addtr_byj">--%>
                            <%--<i class="fa fa-plus"></i>--%>
                        <%--</button>--%>
                    </div>
                </div>
                <!-- BEGIN CONDENSED TABLE PORTLET-->
                <div class="portlet-body" style="display:;">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover table-condensed"
                               id="byjtbl">
                            <thead>
                            <th>序号</th>
                            <th>SAP单号</th>
                            <th>付款方式</th>
                            <th width="15%">预借备用金额</th>
                            <th>到期日期</th>
                            <th>公司名称</th>
                            <th>文本描述</th>
                            </thead>
                            <tbody id="noshot">
                            </tbody>
                        </table>
                        <table id="table1"
                               class="table table-striped table-bordered table-advance table-hover table-condensed">
                        </table>
                    </div>
                </div>
                <!-- END CONDENSED TABLE PORTLET-->
            </div>
        </div>

    </div>

</div>



    <script type="text/javascript">

        jQuery(document).ready(function () {


        });


        function zoa_nomoney(pernr,bukrs){
            if(pernr!=""&&bukrs!=""&&pernr!=null&&bukrs!=null){
                $("#noshot").empty();
                $.getJSON("${ctx}/deposit/gmkdeposit/json/getZoanomoney",
                        {pernr:pernr,bukrs:bukrs},function(data){
                            console.log(pernr)
                            console.log(bukrs)
                            console.log(data)
                            if(typeof data.noshot !='undefined' && data.noshot !=""){
                                if(typeof data.sums !='undefined' ){
                                    $(".byjtbl").show();
                                    var htmltext ='';
                                    $.each(data.noshot,function(i,item){
                                        htmltext += '<tr>';
                                        htmltext += '<td>'+(i+1)+'</td>';
                                        htmltext += '<td>'+item.belnr+'</td>';
                                        if(typeof item.mtype !='undefined'){
                                            htmltext += '<td>'+item.mtype+'</td>';
                                        }else{
                                            htmltext += '<td></td>';
                                        }
                                        htmltext += '<td class="col-md-1 text-right ">'+item.dmbtr.toFixed(2)+'</td>';
                                        htmltext += '<td>'+formatDate(new Date(item.edate))+'</td>';
                                        htmltext += '<td>'+item.bukrs+'-'+item.bukns+'</td>';
                                        if(typeof item.smemo !='undefined'){
                                            //htmltext += '<td>'+item.smemo+'</td>';
                                            htmltext += '<td class="col-md-4"><textarea class=" form-control selectcontrol animated" ';
                                            htmltext += 'style="overflow-y:hidden"  name="zbnamey" readonly>'+item.smemo+'</textarea></td>'
                                        }else{
                                            htmltext += '<td></td>';
                                        }
                                        htmltext += '</tr>';
                                    });
                                    htmltext += '<tr>';
                                    htmltext += '<td>未清合计</td>';
                                    htmltext += '<td></td>';
                                    htmltext += '<td></td>';
                                    htmltext += '<td class="text-right">'+data.sums+'</td>';
                                    htmltext += '<td></td>';
                                    htmltext += '<td></td>';
                                    htmltext += '<td></td>';
                                    htmltext += '</tr>';
                                    $("#noshot").append(htmltext);
                                    $("textarea[name='zbnamey']").autosize();
                                }
                            }else{
                                $(".byjtbl").hide();
                            }

                        });
            }

        }


        var formatDate = function(now){
            var   year=now.getFullYear();
            var   month=now.getMonth()+1;
            if(month<10){month = "0"+month;}
            var   date=now.getDate();
            if(date<10){date = "0"+date;}
            return   year+"-"+month+"-"+date;
        }

    </script>




