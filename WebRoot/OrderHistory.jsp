<%@ page language="java"  import="java.util.*, WebOrder.model.*" pageEncoding="utf-8"%>
<%@ page import = "WebOrder.Userbean.*" %>

<%@ include file="DHeader.jsp"%>
<div class="custom-container main-container col-lg-12 col-md-12 col-sm-12">
	<div class="row">
		<%@ include file="DSidebar.jsp"%>
		<div class="col-md-8 col-lg-9 col-sm-8 page-container">
			<h3>
				历史订单
			</h3>
			<hr>
			<div class="alert_container hide"></div>
		
		
			<div>
			<div class="custom-product row custom-btn-sort">
			
<%
String SPAGE = request.getParameter("page");
if(SPAGE == null || SPAGE.isEmpty())
{
    SPAGE = "1";
}
int spage = Integer.parseInt(SPAGE);
String name = (String)session.getAttribute("username"); 
for(Order order: orderlist.getOList(name,spage) ) 
{
%>


					<div class="col-lg-10">
							
							<div class="caption"></div>
							<p class="order-id">
								订单号: <%=order.getOrderId() %>
							</p>
							<p class="order-time">
								订单日期:<%=order.getOrderDate() %>
							</p>

							<a id="order-info" href="<%=basePath %>/Order.jsp?oid=<%=order.getOrderId() %>"
					            class="show_details_link shopping-cart-btn btn btn-default btn-sm navbar-right hidden-xs hidden-sm">
					                              订单详情
				            </a>
					</div>
					
<% } %>

            </div>
			</div>
		</div>		
	</div>
	
	
<div class="row">
					<div class="pull-right">
						<div class="pagination">
							<ul class="pagination">
							<li  <% if(spage == 1){ %> class = "active" <%}%> >
									<a
									    href="?page=1">1</a>
								</li>
							  
<%
int sumPage = orderlist.getPageNum(name);
int left = Math.max(2,spage-1);
int right = Math.min(sumPage, spage+1);
%>

                               <%if(left != 2){ %>
                               <li   >  
                               <a>...</a>  
                               </li>
                               <% }%>
                               
                               
<% 
for(int curPage = left; curPage <= right; curPage++)
{
%>
                              
								<li  <% if(curPage == spage){ %> class = "active" <%}%> >
									<a
									    href="?page=<%=curPage %>"><%=curPage %></a>
								</li>
<%} %>


                                <%if(spage != sumPage){ %>
								<li>
									<a 
										href="?page=<%=spage+1 %>"
										>Next »</a>
								</li>
								<%} %>
							</ul>
							
						</div>
					</div>

				</div>
				</div>
<%@ include file="DFooter.jsp"%>
