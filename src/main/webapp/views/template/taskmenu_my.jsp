<%@ page contentType="text/html;charset=UTF-8" %>
<%  
	String menu_id = request.getParameter("menu");//对应菜单
    String path = request.getContextPath();
%>
    <ul class="nav nav-tabs">
        <li <% if("4".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>/agpay/agpay/draftlist">  所有申请</a>
        </li>
        <li <% if("2".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>/agpay/agpay/runningtasklist">  运行中</a>
        </li>
       	<li <% if("3".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>/agpay/agpay/finishedtasklist">  已结束</a>
        </li>
          <li <% if("5".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>/agpay/agpay/voidclosedlist">  作废记录</a>
        </li>
    </ul>
