<%@ tag language="java" pageEncoding="UTF-8" description="分页" %>
<%@ attribute name="page" type="com.github.pagehelper.PageInfo" required="true" description="分页" %>
<%@ attribute name="pageSize" type="java.lang.Integer" required="false" description="每页大小" %>
<%@ attribute name="simple" type="java.lang.Boolean" required="false" description="是否简单风格" %>
<%@ attribute name="formName" type="java.lang.String" required="false" description="查询表单id" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<c:if test="${empty pageSize}">
    <c:set var="pageSize" value="${page.pageSize}"/>
</c:if>
<c:if test="${empty simple}">
    <c:set var="simple" value="false"/>
</c:if>
<c:if test="${empty formName}">
    <c:set var="formName" value="searchForm"/>
</c:if>
<c:set var="displaySize" value="2"/>
<c:set var="current" value="${page.pageNum}"/>

<c:set var="begin" value="${current - displaySize}"/>
<c:if test="${begin <= displaySize}">
    <c:set var="begin" value="${1}"/>
</c:if>
<c:set var="end" value="${current + displaySize}"/>
<c:if test="${end > page.pages - displaySize}">
    <c:set var="end" value="${page.pages - displaySize}"/>
</c:if>
<c:if test="${end < 0 or page.pages < displaySize * 4}">
    <c:set var="end" value="${page.pages}"/>
</c:if>

<div class="table-pagination">
    <div style="clear: both;display: inline-block">
        <div class="pull-left dataTables_paginate paging_bootstrap">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${page.isFirstPage}">
                        <li class="disabled"><a title="首页"><i class="fa fa-angle-double-left"></i></a></li>
                        <li class="disabled"><a title="上一页"><i class="fa fa-angle-left"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#" onclick="$.pagination.turnPage('${pageSize}', 1, '${formName}');" title="首页"><i
                                class="fa fa-angle-double-left"></i></a></li>
                        <li><a href="#" onclick="$.pagination.turnPage('${pageSize}', ${current - 1}, '${formName}');" title="上一页"><i
                                class="fa fa-angle-left"></i></a></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${begin == 1 ? 0 : 2}" var="i">
                    <li <c:if test="${current == i}"> class="active"</c:if>>
                        <a href="#" onclick="$.pagination.turnPage('${pageSize}', ${i}, '${formName}');" title="第${i}页">${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${begin > displaySize + 1}">
                    <li><a>...</a></li>
                </c:if>

                <c:forEach begin="${begin}" end="${end}" var="i">
                    <li <c:if test="${current == i}"> class="active"</c:if>>
                        <a href="#" onclick="$.pagination.turnPage('${pageSize}', ${i}, '${formName}');" title="第${i}页">${i}</a>
                    </li>
                </c:forEach>


                <c:if test="${end < page.pages - displaySize}">
                    <li><a>...</a></li>
                </c:if>

                <c:forEach begin="${end < page.pages ? page.pages - 1 : page.pages + 1}" end="${page.pages}" var="i">
                    <li <c:if test="${current == i}"> class="active"</c:if>>
                        <a href="#" onclick="$.pagination.turnPage('${pageSize}', ${i}, '${formName}');" title="第${i}页">${i}</a>
                    </li>
                </c:forEach>

                <c:choose>
                    <c:when test="${page.isLastPage}">
                        <li class="disabled"><a title="下一页"><i class="fa fa-angle-right"></i></a></li>
                        <li class="disabled"><a title="尾页"><i class="fa fa-angle-double-right"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#" onclick="$.pagination.turnPage('${pageSize}', ${current + 1}, '${formName}');" title="下一页"><i
                                class="fa fa-angle-right"></i></a></li>
                        <li><a href="#" onclick="$.pagination.turnPage('${pageSize}', ${page.pages}, '${formName}');" title="尾页"><i
                                class="fa fa-angle-double-right"></i></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <c:if test='${simple eq false}'>
            <div class="pull-left pagination" style="padding: 1px">
            <span class="page-input">
                &nbsp;第&nbsp;<input type="text"
                                    class="pagination-panel-input form-control input-sm input-inline input-mini text-center"
                                    value="${current}" onchange="$.pagination.turnPage('${pageSize}', $(this).val(), '${formName}');"/>&nbsp;页&nbsp;|&nbsp;查看
            </span>
                <select class="form-control input-xs input-sm input-inline"
                        onchange="$.pagination.turnPage($(this).val(), ${current}, '${formName}');">
                    <option value="10" <c:if test="${pageSize eq 10}">selected="selected" </c:if>>10</option>
                    <option value="20" <c:if test="${pageSize eq 20}">selected="selected" </c:if>>20</option>
                    <option value="30" <c:if test="${pageSize eq 30}">selected="selected" </c:if>>30</option>
                    <option value="50" <c:if test="${pageSize eq 50}">selected="selected" </c:if>>50</option>
                </select>&nbsp;条
                <span class="page-info">[共${page.pages}页/${page.total}条]</span>
            </div>
        </c:if>
    </div>
</div>
<script src="${staticServer}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/custom.js" type="text/javascript"></script>
<script type="text/javascript">
    $.pagination.appendHidden('${page.pageSize}', '${page.pageNum}', '${formName}', '${page.orderBy}');
</script>