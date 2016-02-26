<%@ page language="java" import="java.util.*,WebOrder.model.*"
	pageEncoding="utf-8"%>


<html>
<head><script type='text/javascript' src="js/jquery-1.11.1.min.js"></script></head>
<body>
<div class="modal-content" id="cartContent">
	<div class="cartContainer" data-backtocart="">
		<form action="#" class="form-horizontal "
			style="margin: 0;" method="post" accept-charset="utf-8">
			<input type="hidden" name="token_"
				value="44dde2aef3e1511b303e91816665047d" style="display: ">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" title="Close Details">
					X
				</button>
				<h3 id="myModalLabel">
					Shopping Cart
				</h3>
			</div>
			<br>
			<div class="model-container table-responsive" id="ModelProductData">
				<table class="table table-striped table-bordered table-responsive">
					<thead>
						<tr>
							<th data-toggle="true" width="20%">
								Item Description
							</th>
							<th data-hide="phone" width="15%">
								Price
							</th>
							<th data-hide="phone" width="15%">
								Qty
							</th>
							<th style="text-align: right;" width="15%">
								Sub-Total
							</th>
							<th width="5%">
								Remove
							</th>
						</tr>
					</thead>



					<%  
              ShoppingCart sc = (ShoppingCart)session.getAttribute("ShoppingCart");
           
              double total = 0; 
           %>
					<tbody>

						<% if(sc == null){}
                   else
                   {  
                     total = sc.getTotal();
                     for(Product pd : sc.GetSList() )
                     {%>
						<tr>
							<td>
								<%=pd.GetProductName() %></td>
							<td>
								<%=pd.GetProductPrice() %>
							</td>

							<td>
								<input type="hidden" name="1[rowid]"
									value="1b6bb754d2b7cd0444bd2af95162deb6">
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
										<div class="input-group">
											<%=pd.GetProductSCount() %>
										</div>

									</div>
									<!-- /.col-lg-6 -->
								</div>
							</td>

							<td style="text-align: right;">
								<%=pd.GetProductPrice()*pd.GetProductSCount() %></td>

							<td colspan="4">
								<a class="btn btn-default remove-item"
									href="action.jsp?action=delete&productId=<%=pd.GetProductId() %>">
									<i class="glyphicon glyphicon-remove"></i> </a>
							</td>
						</tr>
						<%    }}%>


					</tbody>


				</table>
			</div>
			<div class="modal-footer">


				<div id="shopping_cart_total" class="alert alert-info"
					style="text-align: right;">
					<span class="shiptype" style="float: left; text-align: left">
						请选择运货方式：
					<select id='ships'>
					  <option name="trains"     value ="20">火车</option>
					  <option name="freighter"  value ="10">汽车</option>
					  <option name="airplanes"  value ="30">飞机</option>
					</select> </span> 
					<span id='__total' style="display:none;"><%=total %></span>
						
						
						Base-Total:￥<span id='sum'></span>
					+ Shipping: ￥<span id='the_price'></span> =
					<strong>Total: ￥<span id='total' name="orderTotal"> </span> </strong>

				</div>
				<a href="index.jsp"
					class="btn btn-default btn-sm cart-btn continue-shopping"
					data-dismiss="modal" aria-hidden="true" title="Continue Shopping"><i
					class="glyphicon glyphicon-arrow-left"></i>&nbsp;Continue Shopping</a>
				<a id="a_link" href="ss" onclick="fa()"
					class="btn btn-warning btn-sm cart-btn checkout_submit_order "><i>SubmitOrder</i>
				</a>
				<a href="action.jsp?action=ClearAll"
					class="btn btn-warning btn-sm cart-btn "><i>ClearAll</i> </a>
			</div>
		</form>


<script type="text/javascript">
		$(document).ready(
			function(){
				$('#ships').change(
					function()
					{
						$('#the_price').html($('#ships')[0].selectedOptions[0].value);
						var __total = parseFloat($('#__total').html());
						var ships_cost = parseFloat($('#ships')[0].selectedOptions[0].value);
						$('#sum').html(__total.toString());
						$('#total').html((__total+ships_cost).toString());
					}
				);
				$('#the_price').html($('#ships')[0].selectedOptions[0].value);
				var __total = parseFloat($('#__total').html());
				var ships_cost = parseFloat($('#ships')[0].selectedOptions[0].value);
				$('#sum').html(__total.toString());
				$('#total').html((__total+ships_cost).toString());
				
			}
		);
		function fa()
		{
			$('#a_link').attr('href', 'action.jsp?action=submit&ship=' + $('#ships')[0].selectedOptions[0].getAttribute('name'));
			return true;
		}
</script>
	</div>
</div>
</body>
</html>