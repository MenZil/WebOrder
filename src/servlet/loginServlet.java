package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import WebOrder.DB.DBManager;


public class loginServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 6722311109528353849L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
               doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		response.setContentType("text/html;charset = utf-8");
		
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path;
		//获取姓名以及密码                                                                              // String userName = request.getParameter( "userName" );
		                                              // String password = request.getParameter( "password" );
		String userName = new String(request.getParameter( "userName" ).getBytes("ISO-8859-1"),"UTF-8");
		String password = new String(request.getParameter( "password" ).getBytes("ISO-8859-1"),"UTF-8");
		
		
		        //---------从数据库中查询
		int result = 0;
		ResultSet rs = null;
		String sqlQuery = "SELECT userName,userPassword FROM userlist";
		
		DBManager db = new DBManager();
		db.openConnection();
		rs = db.queryDatabase(sqlQuery);
		
		try {
			while(rs.next())  
			{
			                //System.out.println(rs.getString("userName"));
			                //System.out.println(userName);
			   if(rs.getString("userName").equals(userName))
			   {
				   if(rs.getString("userPassword").equals(password))
				   {
					   result = 1;  
				   }
				   else
				   {
					   result = 2;
				   }
				   break;   
			   }
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		   //-----处理登陆的三种情况
		String LoginMessage = "";
		switch(result)
		{
		    case  0:
		    	//无此用户
		    	LoginMessage =  "无此用户";
		    	request.getSession().setAttribute("DLogin", LoginMessage);
		    	response.sendRedirect(basePath+"/DLogin.jsp");
		    	break;
		    	
		    case  1:
		         //登陆成功
		    	LoginMessage =  "登陆成功";
		    	request.getSession().setAttribute("DLogin", LoginMessage);
		    	request.getSession().setAttribute("username", userName);
		    	response.sendRedirect(basePath+"/index.jsp");
		        break;
		        
		    case  2:
		    	//有此用户，但密码不正确
		    	LoginMessage =  "有此用户，但密码不正确";
		    	request.getSession().setAttribute("DLogin", LoginMessage);
		    	response.sendRedirect(basePath+"/DLogin.jsp");
		    	break;
		
		}
		
		
		
	}

}
