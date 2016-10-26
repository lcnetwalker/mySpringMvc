<%@page import="com.gmk.framework.common.utils.UserUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<div class="header navbar navbar-inverse navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner">
		<!-- BEGIN LOGO -->
		<a class="navbar-brand" href="/">&nbsp;&nbsp;<tags:i18n key="basic_platform"/>
		</a>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse"> <img
			src="${ctx}/assets/img/menu-toggler.png" alt="" />
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<ul class="nav navbar-nav pull-right">
			<!-- BEGIN NOTIFICATION DROPDOWN -->
			<!-- 消息通知注释掉  wj  -->
		<!-- 
		<li class="dropdown" id="header_notification_bar"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <i class="fa fa-warning"></i> <span
					class="badge">1</span>
			</a>
				<ul class="dropdown-menu extended notification">
					<li>
						<p id="p_msg">你有1个新的通知</p>
					</li>
					<li>
						<ul class="dropdown-menu-list scroller" style="height: 250px;">
							<li><a href="#"> <span
									class="label label-sm label-icon label-success"><i
										class="fa fa-plus"></i></span> 新的会议通知 <span class="time">刚刚</span>
							</a></li>
						</ul>
					</li>
					<li class="external"><a href="#">查看所有通知 <i
							class="m-icon-swapright"></i></a></li>
				</ul></li>
				 -->
			<!-- END NOTIFICATION DROPDOWN -->
			<!-- BEGIN INBOX DROPDOWN -->
			<!-- 邮件通知注释掉  wj -->
		<!--  	<li class="dropdown" id="header_inbox_bar"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <i class="fa fa-envelope"></i> <span
					class="badge">5</span>
			</a>
				<ul class="dropdown-menu extended inbox">
					<li>
						<p>你有5个新的邮件</p>
					</li>
					<li>
						<ul class="dropdown-menu-list scroller" style="height: 250px;">
							<li><a href="#"> <span class="photo"><img
										src="${ctx}/assets/img/avatar2.jpg" alt="" /></span> <span
									class="subject"> <span class="from">张三</span> <span
										class="time">刚刚</span>
								</span> <span class="message"> 下班去吃饭... </span>
							</a></li>
						</ul>
					</li>
					<li class="external"><a href="inbox.html">查看所有邮件 <i
							class="m-icon-swapright"></i></a></li>
				</ul></li>-->
			<!-- END INBOX DROPDOWN -->
			<!-- BEGIN TODO DROPDOWN -->
			<!-- header 中的通知注释掉了 -->
		<!-- 
		<li class="dropdown" id="header_task_bar"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <i class="fa fa-tasks"></i> <span
					class="badge">5</span>
			</a>
				<ul class="dropdown-menu extended tasks">
					<li>
						<p>你有5个待处理的任务</p>
					</li>
					<li>
						<ul class="dropdown-menu-list scroller" style="height: 250px;">
							<li><a href="#"> <span class="task"> <span
										class="desc">框架搭建</span> <span class="percent">60%</span>
								</span> <span class="progress"> <span style="width: 60%;"
										class="progress-bar progress-bar-success" aria-valuenow="60"
										aria-valuemin="0" aria-valuemax="100"> <span
											class="sr-only">60% 完成</span>
									</span>
								</span>
							</a></li>
						</ul>
					</li>
					<li class="external"><a href="#">查看所有任务 <i
							class="m-icon-swapright"></i></a></li>
				</ul></li>	
				 -->
			<!-- END TODO DROPDOWN -->
			<li ><a  href="#" style="padding-top: 8px"><!-- 支持热线：0635-6555140 --></a></li>			
			<!-- BEGIN USER LOGIN DROPDOWN -->
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <%--<img alt=""
					src="${ctx}/assets/img/avatar1_small.jpg" />--%> <span
					class="username"><%=UserUtils.getUser().getName() %></span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu">
					<li><a href="${ctx}/sys/user/show/${currentUser.id}"><i
							class="fa fa-user"></i> 我的信息</a></li>
					<%--<li><a href="#"><i class="fa fa-calendar"></i> 我的日历</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> 我的邮箱 <span
							class="badge badge-danger">5</span></a></li>
					<li><a href="#"><i class="fa fa-tasks"></i> 我的任务 <span
							class="badge badge-success">5</span></a></li>--%>
					<li class="divider"></li>
					<li><a href="javascript:;" id="trigger_fullscreen"><i
							class="fa fa-move"></i> 全屏</a></li>
					<%--<li><a href="#"><i class="fa fa-lock"></i> 锁屏</a></li>--%>
					<li><a href="https://sso.xiangguang.com/logout?service=${basePath }/logout"><i class="fa fa-key"></i> 退出</a></li>
				</ul></li>
			<!-- END USER LOGIN DROPDOWN -->
		</ul>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
