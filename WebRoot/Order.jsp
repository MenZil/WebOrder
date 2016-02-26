<%@ page language="java" import="java.util.*,WebOrder.model.*" pageEncoding="utf-8"%>
<%@ page import="WebOrder.Userbean.*" %>


<div class="modal-content" id="cartContent">
  <div class="cartContainer" data-backtocart="">
    <form
			action="#"
			class="form-horizontal ajax-cart-form" style="margin: 0;"
			method="post" accept-charset="utf-8">
      <input type="hidden" name="token_"
				value="44dde2aef3e1511b303e91816665047d" style="display: ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" title="Close Details">X</button>
        <h3 id="myModalLabel"> Order INFO </h3>
      </div>
      <br>
      <div class="model-container table-responsive" id="ModelProductData">
        <table class="table table-striped table-bordered table-responsive">
          <thead>
            <tr>
              <th data-toggle="true" width="20%"> Item Description </th>
              <th data-hide="phone" width="15%"> Price </th>
              <th data-hide="phone" width="15%"> Qty </th>
              <th style="text-align: right;" width="15%"> Sub-Total </th>
            </tr>
          </thead>
          
          
          <%  
           String shipmode=null;
           int oid = Integer.parseInt(request.getParameter("oid"));
           Shop hsc = (Shop)session.getAttribute("HShoppingCart");
           if(hsc == null)
           {
           		 hsc = new Shop();
           		 session.setAttribute("HShoppingCart",hsc );
           	}
           	else
           	{
           	    hsc.ClearAll();        	 
           	}
           	
		   for(Order horder: orderlist.getList(oid) ) 
		   {
				String strId = Integer.toString(horder.getProductId());
				String num   = Integer.toString(horder.getProductCount());
				shipmode = horder.getShipmode();
				
				hsc.AddtoShoppingCart(strId, num);	
			}
			    double shipmoney=0;
				if("trains".equals(shipmode))           shipmoney = 20.00;
				else if("freighter".equals(shipmode))   shipmoney = 10.00;
				else if("airplanes".equals(shipmode))   shipmoney = 30.00;
				
             double htotal = 0; 
           %>
          <tbody>
           
                <% if(hsc == null){}
                   else
                   {  
                     htotal = hsc.getTotal();
                     for(Product pd : hsc.GetSList() )
                     {%>
              <tr>
              <td> <%=pd.GetProductName() %></td>
              <td> <%=pd.GetProductPrice() %> </td>
              
              <td><input type="hidden" name="1[rowid]"
									value="1b6bb754d2b7cd0444bd2af95162deb6">
                <div class="row">
                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="input-group">   <%=pd.GetProductSCount() %> </div>
                  
                  </div>
                  <!-- /.col-lg-6 --> 
                </div></td>
                
              <td style="text-align: right;"> <%=pd.GetProductPrice()*pd.GetProductSCount() %></td>
              
           
				 </tr>			  
				<%    }}%>
				
          </tbody>
          
          
        </table>
      </div>
      <div class="modal-footer">
        <div id="shopping_cart_total" class="alert alert-info"
					style="text-align: right;"> Base-Total: ￥<%=htotal %> + Shipping: ￥<%=shipmoney %> = <strong>Total: ￥<%=htotal+shipmoney %> </strong>
         
        </div>
        
	  </div>
    </form>
    
    
  
  </div>
</div>
