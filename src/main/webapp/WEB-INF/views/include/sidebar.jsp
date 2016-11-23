<%@ page contentType="text/html;charset=UTF-8" %>

<div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <ul class="page-sidebar-menu">

        <li>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        </li>
            <li class="start ">
                    <a href="${ctx}/<c:if test='${performance}'>performance/home</c:if>">
                        <span class="title"></span>
                        <span class="selected"></span>
                    </a>
                </li>
        <li>
            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
         <!--    <form class="sidebar-search" action="${ctx}/" method="get">
                <div class="form-container">
                    <div class="input-box">
                        <a href="javascript:;" class="remove"></a>
                        <input type="text" placeholder="搜索..."/>
                        <input type="button" class="submit" value=" "/>
                    </div>
                </div>
            </form>--> 
            <!-- END RESPONSIVE QUICK SEARCH FORM -->
        </li>
        <c:choose>
            <c:when test='${activeMenu eq "0"}'>
                <li class="start active">
                    <a href="${ctx}/<c:if test='${performance}'>performance/home</c:if>">
                        <i class="fa fa-home"></i>
                        <span class="title" style="padding: 1px 1px;">首页</span>
                        <span class="selected"></span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="">
                    <a href="${ctx}/<c:if test='${performance}'>performance/home</c:if>">
                        <i class="fa fa-home"></i>
                        <span class="title" style="padding: 1px 1px;">首页</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        ${activeMenuStr}

    <%-- <li class="last ">
            <a href="charts.html">
                <i class="icon-bar-chart"></i>
                <span class="title">Visual Charts</span>
            </a>
        </li>--%>
    </ul>
    <!-- END SIDEBAR MENU -->
</div>
