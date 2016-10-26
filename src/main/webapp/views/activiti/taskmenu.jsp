<%@ page contentType="text/html;charset=UTF-8" %>
<%  
	String menu_id = request.getParameter("menu");//对应菜单
    String path = request.getContextPath();
%>
    <ul class="nav nav-tabs">
        <li <% if("1".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>">  我的申请</a>
        </li>
        <li <% if("2".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>">  待办理</a>
        </li>
        <li <% if("3".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>">  运行中</a>
        </li>
       	<li <% if("4".equals(menu_id)){ %> class="active" <%}%>>
            <a href="<%=path%>">  已结束</a>
        </li>
    </ul>
