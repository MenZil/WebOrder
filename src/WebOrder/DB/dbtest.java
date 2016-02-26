package WebOrder.DB;

import java.sql.ResultSet;
import java.sql.SQLException;

public class dbtest {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		
		DBManager db = new DBManager();
	
		
		String sqlQuery = "SELECT userId,userName,userPassword FROM userlist";
		ResultSet  rs = null;
		
		db.openConnection();
		rs = db.queryDatabase(sqlQuery);
		while(rs.next())
		{
			
			
			if(rs.getString("userName").equals("°¢¼ª") && (rs.getString("userPassword").equals("53120814")) )
			{
				System.out.println(rs.getString("userName"));
				System.out.println(rs.getString("userPassword"));
			}
			
		}
		db.closeConnection();	}

}
