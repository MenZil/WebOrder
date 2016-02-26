<%@ page language="java"  import="java.util.*, WebOrder.model.*" pageEncoding="utf-8"%>
<%@ page import = "WebOrder.Userbean.*" %>

<%@ include file="DHeader.jsp"%>
<div class="custom-container main-container col-lg-12 col-md-12 col-sm-12">
	<div class="row">
		<%@ include file="DSidebar.jsp"%>
		<div class="col-md-8 col-lg-9 col-sm-8 page-container">
			<div class="alert alert-info" style="text-align: center;">
				<% 
				  String LM = (String)session.getAttribute("DLogin");
				  out.print(LM);
				%>
			</div>
			<h3>
				All Products
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
    
for(Product pd : productlist.GetList(spage) ) 
{
%>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-4 thumb thumb-image-view" style="height: 380px;">
						<div class="thumbnail text-center">
							<div class="thumb-image">
								<a title="Musical"><img
										src="./img/<%=pd.GetProductImages() %>"
										class="img-responsive" alt="">
								</a>
							</div>
							
							<div class="caption"></div>
							<p title="Musical">
								<%=pd.GetProductName() %>
							</p>
							<p class="store-product-price">
								￥ <%=pd.GetProductPrice() %> 
							</p>
							<a title="Musical" class="show_details_link"
								href="detail.jsp?productId=<%=pd.GetProductId() %>"
								class="btn">详细信息</a>
						</div>
					</div>
<% } %>
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
int sumPage = productlist.getSumPage();
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
				

<script>				
/*! Equal Heights */
var currentTallest = 0, currentRowStart = 0, rowDivs = new Array(), $el, topPosition = 0;
$(".thumb-image-view").each(
		function() {
			$el =

			$(this);
			topPostion = $el.position().top;
			if (currentRowStart != topPostion) {
				for

				(currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
					rowDivs[currentDiv].height(currentTallest)
				}

				rowDivs.length = 0;
				currentRowStart = topPostion;
				currentTallest = $el.height();
				rowDivs.push($el)
			} else {
				rowDivs.push

				($el);
				currentTallest = (currentTallest < $el.height()) ? ($el
						.height()) : (currentTallest)
			}
			for

			(currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
				rowDivs[currentDiv].height(currentTallest)
			}
		});
</script>

			</div>
		</div>
	</div>

<%@ include file="DFooter.jsp"%>
