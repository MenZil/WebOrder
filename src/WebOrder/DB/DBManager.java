package WebOrder.DB;

import java.sql.*;

public class DBManager {
	
	private Connection dbConnection;
	private Statement  queryStatement;
	private ResultSet  queryResultSet;
	
	
	  //----数据库用户名及密码
	private String  dbUsername = "root";   
	private String  dbPassword = "";
	
	

	public DBManager()
	{
	}


	
	    //----打开数据库
	public boolean openConnection() 
	{		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");	

					
			dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weborder?useUnicode=true&characterEncoding=utf-8", 
							dbUsername, dbPassword);
			queryStatement = dbConnection.createStatement();
			String sql = "SET NAMES UTF8;";
			queryStatement.executeQuery( sql );
			
		}
		catch(ClassNotFoundException cnfe)
		{
			System.out.println(cnfe);
			return false;
		}
		catch(SQLException sqle) 
		{
			System.out.println(sqle);
			return false;
		}

		return true;			
	}	


	   //---关闭数据库
	public boolean closeConnection() 
	{		
		try 
		{
			dbConnection.close();
		}
		catch(SQLException sqle) 
		{
			System.out.println(sqle);
			return false;
		}

		return true;			
	}	


	   //---数据库查询
	public ResultSet queryDatabase(String firstQuery)
	{
		try 
		{
			queryResultSet = queryStatement.executeQuery( firstQuery );
		}
		catch(SQLException sqle) 
		{
			System.out.println(sqle);
			return null;
		}

		return queryResultSet;	
	}


	    //---更新数据库
	public boolean updateDatabase(String firstQuery)
	{
		try 
		{
			queryStatement.executeUpdate( firstQuery );
		}
		catch(SQLException sqle) 
		{
			System.out.println(sqle);
			return false;
		}

		return true;
	}



}
