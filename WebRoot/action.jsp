<%@ page language="java" import="java.util.*,WebOrder.model.*,WebOrder.DB.*" pageEncoding="utf-8"%>
<%@ page import = "java.sql.ResultSet,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat" %>

<%

String ship = request.getParameter("ship");        //运输方式

String action = request.getParameter( "action" );  //动作

ShoppingCart sc = (ShoppingCart)session.getAttribute( "ShoppingCart" );   //购物车信息保存在session当中

if( "quite".equals( action ) ) 
{ 
   //------退出当前登录用户
	session.removeAttribute("DLogin");
	session.removeAttribute("username");
	session.removeAttribute("ShoppingCart");
	session.removeAttribute("HShoppingCart");
	response.sendRedirect( "DLogin.jsp" );
	  	
}

if( sc == null ) {
	sc = new ShoppingCart();
	session.setAttribute( "ShoppingCart",sc );
}

      
if( "buy".equals( action ) ) 
{  //----购买
	String strId = request.getParameter( "productId" );
	String num = request.getParameter("num");
	sc.AddtoShoppingCart(strId, num);
}


else if( "info".equals( action ) )
 { // ----详情
 
   RequestDispatcher rd = request.getRequestDispatcher( "detail.jsp");
   rd.forward(request,response);
	
} 

else if( "delete".equals( action ) ) 
{ // -----删除
	String strId = request.getParameter( "productId" );
	sc.delete( strId );
	
	
}

else if( "ClearAll".equals( action ) ) 
{ // ------清空
	sc.ClearAll(); 
	response.sendRedirect("index.jsp" );
}

else if("submit".equals(action))
{ // ----提交,写入数据库中
   DBManager dbm = new DBManager();
   dbm.openConnection();
  
 
   int oid = 0;
   int o1 = 0;
   int o2 = 0;
   Date date = new Date();  
   int uid = 0;
   
   
   String sqlQuery = "SELECT MAX(orderId) as max FROM orderlist";
   
   ResultSet rs = dbm.queryDatabase(sqlQuery);
   
   if(rs != null)
   {
   		while(rs.next())
   		{
   			oid = rs.getInt("max");
   		}
   }
   
   oid = oid +1;
   String name = (String)session.getAttribute("username");
   String uname = new String(name.getBytes("ISO-8859-1"),"UTF-8");
   
   sqlQuery = "SELECT userId FROM userlist WHERE userName = " + "\""+ name +"\"";
   
   rs = dbm.queryDatabase(sqlQuery);
   if(rs != null)
   {
   		while(rs.next())
   		{
   			uid = rs.getInt("userId");
   		
   		}
   }
   
   for(Product pd : sc.GetSList())
   {
  		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
  		String odate=format.format(date);
       
  		 
  		int ocount = pd.GetProductSCount();
  		String oship = ship;
  		int ocost = ocount * pd.GetProductPrice();
  		int pid = pd.GetProductId();
  		
   		sqlQuery = "INSERT INTO orderlist(orderId,orderDate,productCount,shipmode,cost,userId,productId) VALUES("
   		                    +oid+ "," + "\""+odate+"\""+ "," +ocount+ "," +"\""+oship+ "\"" +"," +ocost+ "," +uid+ "," +pid + ")";
   		
     
   		dbm.updateDatabase(sqlQuery);
   		
   		   		
   }
   dbm.closeConnection();
   sc.ClearAll(); 
   response.sendRedirect("index.jsp");
   
  
}
%>
