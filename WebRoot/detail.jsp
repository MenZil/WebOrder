<%@ page language="java" import="java.util.*,WebOrder.model.*,WebOrder.Userbean.*" pageEncoding="utf-8" %>
<%@ page import="java.io.PrintWriter" %>
<%! 
	int price;
	String name;
	int id;
	String strId = "1";
 %>
<!-- Modal -->
			
				
					<div class="modal-content" id="cartContent">
						<div class="modal-header">
						<s:property value="message"/>
						
						
						<%
							String __strId=request.getParameter("productId");
						   // productlist pinfo = new productlist();
						    if(__strId!=null) strId=__strId;
							Product pt =  productlist.FindById(strId);
							id = pt.GetProductId();
							
							 name = pt.GetProductName();
							 price = pt.GetProductPrice();
							String description = pt.GetProductDescription();
							int weight=pt.GetProductWeight();
							String images = pt.GetProductImages();
							int count = pt.GetProductSCount();
																
						%>
						
						
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true" title="Close Details">
								x
							</button>
							<h3 class="modal-title">
								<%=name %>		
							</h3>
							<h4>
								<small>  ProductID: <strong id="pid"><%=(id) %></strong> </small>
								<strong class="store-p-price"> &nbsp; Price: <%=(price) %></strong>
							</h4>
						</div>

						<div class="modal_body custom-modal-body" id="ModelProductData">
							<p></p>
							
							<p>
								<strong>详细信息：  </strong><img src="./img/<%=(images) %>" style="float:left; margin:10px">
								<%=(description) %>
							</p>
							
							<p></p>
						</div>
													
						<div class="modal-footer">
							<form
								action="#"
								class="form-inline" id="addToCart" name="addToCart" role="form"
								method="post" accept-charset="utf-8">
								<input type="hidden" name="token_"
									value="44dde2aef3e1511b303e91816665047d" style="display: none;">

								<input type="hidden" name="product_id" value="16">

								<div class="form-group">
									<div class="input-group" style="width: 200px">
										<div class="input-group-addon">
											Size:
										</div>
										<select name="size" class="form-control" >
											<option value="400">
												400
											</option>
											<option value="500">
												500
											</option>
											<option value="1000">
												1000
											</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group" style="width: 200px">
										<span class="input-group-addon">Color:</span>
										<select name="color" class="form-control" >
											<option value="red">
												red
											</option>
											<option value="gray">
												gray
											</option>
											<option value="black">
												black
											</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<div class="input-group" style="width: 300px">
										<span class="input-group-btn"><a href="#"
											class="btn btn-default decrement_qty qty-btn">-</a>
										</span>
										<input type="number" name="product_qty" value="1"
											class="form-control text-center" id="product_qty" required=""
											min="1">
										<span class="input-group-btn"><a href="#"
											class="btn btn-default increment_qty qty-btn qty-btn-last">+</a>
										</span>
										<span class="input-group-btn">
											<button type="submit" name="addToCartBtn" id="addToCartBtn" 
												class="btn btn-warning">									
								                  Add to
												<i class="glyphicon glyphicon-shopping-cart icon-white"></i>
											</button> </span>
									</div>
								</div>
							</form>
						</div>




<script type="text/javascript">
$(document)
		.ready(
				function($) {
					var isAjaxReq = true;

					var $addToCartBtn = $('#addToCartBtn'), $product_qty = $('#product_qty'), $shopping_cart_btn = $('.shopping-cart-btn');

					$('#addToCart')
							.submit(
									function(e) {
										e.preventDefault();

										product_qty = $product_qty.val();

										if (product_qty <= 0) {
											return false;
										}

										var $this = $(this), formAction = $this
												.attr('action');

										if ($addToCartBtn.hasClass('disabled')) {
											return false;
										}

										$addToCartBtn.addClass('disabled');
										$
												.post(
														formAction,
														$this.serialize(),
														function(data) {
															$addToCartBtn
																	.html(
																			'Update <i class="glyphicon glyphicon-shopping-cart icon-white"></i>')
																	.removeClass(
																			'disabled');

															$shopping_cart_btn
																	.html(
																			data.cartBtnString)
																	.find(
																			'i.icon-shopping-cart')
																	.removeClass(
																			'icon-shopping-cart')
																	.addClass(
																			'glyphicon glyphicon-shopping-cart');

															

														}, "JSON").fail(
														function(error) {
															
														});
														
						var pid = $('#pid').html();
						var path = './action.jsp?action=buy&productId=' + pid + '&num=' +product_qty;
						$.get(
								path,
								{},
								function(data, state){}
							);

									});

					$('#size,#color').on('change', checkCartForItem);

					function checkCartForItem() {

						$addToCartBtn.addClass('disabled');

						var cartCheckURL = "#";

						$
								.post(
										cartCheckURL,
										$('#addToCart').serialize(),
										function(data) {
											$product_qty
													.val(data.qty ? data.qty
															: 1);

											if (data.qty > 0) {
												$addToCartBtn
														.html('Update <i class="glyphicon glyphicon-shopping-cart icon-white"></i>');
											} else {
												$addToCartBtn
														.html('Add to <i class="glyphicon glyphicon-shopping-cart icon-white"></i>');
											}

											$addToCartBtn
													.removeClass('disabled');

										}, "JSON").fail(function(error) {

								});

					}

					$('.qty-btn')
							.on(
									'click',
									function(e) {
										e.preventDefault();
										var $this = $(this), product_qty_val = Number($product_qty
												.val());

										if ($this.hasClass('increment_qty')) {
											$product_qty
													.val(product_qty_val + 1);
										} else {
											var newQtyVal = (product_qty_val - 1);
											$product_qty
													.val((newQtyVal <= 0) ? 1
															: newQtyVal);
										}
									});
				});
</script>
					</div>

				
					
					<!-- /.modal-content -->
				