<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="DHeader.jsp"%>
<div class="custom-container main-container col-lg-12 col-md-12 col-sm-12">
	<div class="row">
		<%@ include file="DSidebar.jsp"%>
		<div class="col-md-8 col-lg-9 col-sm-8 page-container">
		<% 
		 	String LM = (String)session.getAttribute("DLogin");
		 	if(LM==null || LM.isEmpty()) LM="欢迎光临";
			if(!"登陆成功".equals(LM))
			{	%>
		<div class="alert alert-danger" style="text-align: center;">
				<% out.print(LM); %>
		</div>
		<form
				action="<%=basePath%>/loginServlet"
				class="form-horizontal" method="post" accept-charset="utf-8">
				<input type="hidden" name="token_"
					value="44dde2aef3e1511b303e91816665047d" style="display: none;">

				<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-10">
					<h3>
						登陆
					</h3>
					<hr>
					
					<br>
					<div class="form-group">
						<label for="login"
							class="col-xs-8 col-sm-4 col-md-4 col-lg-3  control-label">
							Email 或 账户
						</label>
						<div class="col-sm-8  col-md-8  col-lg-6 ">
							<input type="text" name="userName" value="" id="userName"
								maxlength="80" size="30" required="" autocomplete="off"
								class="form-control">
							<span class="help-inline error_msg"> </span>
						</div>
					</div>

					<div class="form-group">
						<label for="password"
							class="col-xs-8 col-sm-4 col-md-4 col-lg-3  control-label">
							密码
						</label>
						<div class=" col-sm-8 col-md-8 col-lg-6 ">
							<input type="password" name="password" value="" id="password"
								size="30" required="" autocomplete="off" class="form-control">
							<span class="help-inline error_msg"> </span>
						</div>
					</div>



					

					<div class="form-group">
						<div
							class="col-lg-offset-3 col-sm-offset-4 col-md-offset-4 col-sm-8 col-md-8 col-lg-8">
							<input type="submit" name="submit" value="登陆"
								class="btn btn-primary">
							
						</div>
					</div>


				</div>
			</form>
				<%
				}
				else
				{
					String UN = (String)session.getAttribute("username");
					out.print("当前用户为："+UN);
				%>	
				<a href="action.jsp?action=quite">退出</a>
						
				<% } %>
				
			
						
		</div>

	</div>
</div>
<%@ include file="DFooter.jsp"%>
