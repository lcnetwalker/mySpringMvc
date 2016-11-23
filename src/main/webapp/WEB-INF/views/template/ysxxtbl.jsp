<%@ page contentType="text/html;charset=UTF-8"%>
<div class="portlet box ysxxtbl" >
    <div class="portlet box">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-align-justify"></i> 预算信息[浅粉色标注: 100%&lt;超预算比例&lt;=120%  淡青色标注: 120%&lt;超预算比例&lt;=150%  浅黄色标注: 超预算比例&gt;150%]
            </div>
            <div class="tools">
                <a class="collapse" href="javascript:;"></a>
            </div>

        </div>
        <div class="portlet-body" >
            <div class="form-body form-horizontal">
                <div class="row">
                    <div class="col-md-12">

                        <div class="form-group">
                            <!-- <label class="control-label col-md-2"></label> -->
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered table-advance table-hover table-condensed" id="ysxxtbl">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th style="vertical-align: top">(1)<br/>公司代码</th>
                                        <th style="vertical-align: top">(2)<br/>预算控制成本中心/内部订单号</th>
                                        <th style="vertical-align: top">(3)<br/>预算控制类型</th>
                                        <th style="vertical-align: top">(4)<br/>年度</th>
                                        <th style="vertical-align: top">(5)<br/>季度</th>
                                        <th style="vertical-align: top">(6)<br/>会计科目编号</th>
                                        <th style="vertical-align: top">(7)<br/>会计科目名称</th>
                                        <th style="vertical-align: top">(8)<br/>预算值</th>
                                        <th style="vertical-align: top">(9)<br/>本单据发生额</th>
                                        <th style="vertical-align: top">(10)<br/>OA系统流转中费用</th>
                                        <th style="vertical-align: top">(11)<br/>SAP系统已记账费用</th>
                                        <th style="vertical-align: top">(12)<br/>SAP系统预算余额</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ysxxs}" var="ysxxitem" varStatus="vstt">
                                        <tr>
                                            <td>${vstt.index + 1}</td>
                                            <td>${ysxxitem.ysxx_bukrs }</td>
                                            <td>${ysxxitem.ysxx_cbzx }</td>
                                            <td>${ysxxitem.ysxx_yskzlx }</td>
                                            <td>${ysxxitem.ysxx_nd }</td>
                                            <td>${ysxxitem.ysxx_jd }</td>
                                            <td>${ysxxitem.ysxx_kjkmbh }</td>
                                            <td>${ysxxitem.ysxx_kjkmmc }</td>
                                            <td>${ysxxitem.ysxx_ysz }</td>
                                            <td>${ysxxitem.ysxx_bdjfse }</td>
                                            <td>${ysxxitem.ysxx_oaxtlzzfy }</td>
                                            <td>${ysxxitem.ysxx_sapxtyjzfy }</td>
                                            <td>${ysxxitem.ysxx_sapxtysye }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/span-->
            </div>
        </div>

    </div>

</div>



    <script type="text/javascript">

        jQuery(document).ready(function () {

        });




        function validateTbl_ysxx(){

            //说明：array_cols是要验证的table的列号
            var tbl="ysxxtbl";
            var rows = $("#"+tbl+" tbody tr").length;
            var array_cols =[3];    //表格中要验证必填的列号码
            var msg="";
            if(rows>0){//验证是否含有空数据
                var flag=true;
                for(i=0;i<rows;i++){
                    array_cols.forEach(function(e){//e为每个元素
                        var content_td = $("#"+tbl+" tbody tr").eq(i).find("td").eq(e).text()
                        var fnl = content_td.replace(/\s+/g,'');//过滤空格

                        if(fnl==""){
                            $("#"+tbl+" tbody tr").eq(0).find("td").css("background", "yellow");
                            var paytp = $('input:radio[name="m_frepaytp"]:checked').val(); //预算类型
                            if(paytp=="1"){
                                msg=$("#"+tbl+" tbody tr").eq(0).find("td").eq(7).text();
                                flag=false;
                                return;
                            }
                        }

                    });

                }
                if(!flag){

                    alert(msg+" 无预算,请选择\"预算外\"继续提交！")
                }
                return flag;
            }else{
                return true;
            }


        }

    </script>




