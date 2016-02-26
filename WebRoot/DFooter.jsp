
<div id="footer">
	<div class="col-lg-12">
		<br>
		<p class="text-muted credit">
			2015 JQuery+Java Mshop
			<small class="pull-right">Powered by <a
				href="http://www.menzil.cn" title="Powered by Dshop"
				target="_blank">Dshop</a> - 1.0 by <a
				href="#"
				title="Design &amp; Developed by M team" target="_blank">D team</a>
			</small>
		</p>
	</div>
</div>

<!-- SCIPRTs -->
<script src="./js/bootstrap.min.js" type="text/javascript"
	charset="utf-8">
</script>
<script src="./js/custom.js" type="text/javascript" charset="utf-8">
</script>
<script type="text/javascript">
$(document)
		.ready(
				function() {

					/*Ajax Product details in Modal*/

					$alert_container = $('.alert_container');

					$('.show_details_link')
							.on(
									'click',
									function(e) {
										$alert_container.fadeOut();
										e.preventDefault();
										$ModelProductName = $('#cartContent');
										$ModelProductData = $('#cartModal');
										var toURL = $(this).attr('href');
										$ModelProductName.html('<div style="padding:10%; text-align:center;">  <img src="http://jqueryphpstoreshop-demo.livelyworks.net/1.2.0/assets/img/ajax-loader.gif"></br> Loading...</div>');
										$ModelProductData.modal('show');
										$
												.get(
														toURL,
														function(data,
																textStatus, xhr) {
															if (data.error) {
																$alert_container
																		.html(
																				'<div class="alert alert-error"> <button type="button" class="close" data-dismiss="alert">&times;</button> <strong>Warning!</strong> ' + data.error + '</div>')
																		.fadeIn();
																return false;
															}
															$ModelProductName.html(data);
														});
									});
					/*Ajax Product details in Modal End*/

				});
</script>

<script type="text/javascript">
$(document)
		.ready(
				function($) {
					$(window).on('resize', onResizeWindow);

					$('.warning-msg .alert').addClass('alert-warning');

					function onResizeWindow() {
						var modalModifiedStyle = '.modal-body{max-height:' + ($(
								window).height() * 0.35) + 'px;}';
						$('#modalModifiedStyle').html(modalModifiedStyle);
					}

					onResizeWindow();

					$('#shopping-cart-btn, .shopping-cart-btn')
							.on(
									'click',
									function(e) {
										e.preventDefault();

										$('#cartModal').modal('show');

										var $this = $(this), $cartModal = $('#cartContent'), requestURL = $this
												.attr('href');
										$cartModal
												.html('<div style="padding:10%; text-align:center;">  <img src="http://jqueryphpstoreshop-demo.livelyworks.net/1.2.0/assets/img/ajax-loader.gif"></br> Loading...</div>');
										$.post(requestURL, function(data) {
											$cartModal.html(data.page_data);
										}, 'JSON');
									});

				});
</script>

<script src="./js/footable.min.js" type="text/javascript">
</script>

</div>
</body>
</html>
