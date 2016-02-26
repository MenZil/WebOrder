package WebOrder.Userbean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import WebOrder.DB.DBManager;
import WebOrder.model.Order;


public class orderlist {
	
	private static List<Order> list = new ArrayList<Order>();
	public  static final int OrderNum = 8;
	
	
	         //------------���ݿ���²�������ȡ���¶�����Ϣ
	public static void  updateSql()
	{
		//System.out.println("updateSql--------------start---");
		list = new ArrayList<Order>();
		DBManager db = new DBManager();
    	String sqlQuery = "SELECT * FROM orderlist ORDER BY orderId DESC";
    	db.openConnection();
    	ResultSet rs = db.queryDatabase(sqlQuery);
    	try {
			while(rs.next())
			{
				Order o = new Order();
				o.setOrderId(rs.getInt("orderId"));
				o.setOrderDate(rs.getString("orderDate"));
				o.setProductCount(rs.getInt("productCount"));
				o.setShipmode(rs.getString("shipmode"));
				o.setCost(rs.getInt("cost"));
				o.setUserId(rs.getInt("userId"));
				o.setProductId(rs.getInt("productId"));
				
				list.add(o);	
			}
			db.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("----------------end-----------------------------------\n\n");
	}
	   //-------------�����ݿ��л�ȡ������Ϣ
    static
    {
    	//updateSql();
    }
    
    
    
    
         //-------���ر�ͷ
    public static List<Order> getList()
    {
    	updateSql();
    	return list;
    }
    
    
    
         //---------�õ�oredrlist by uname&&page
    public static Order[] getOList(String uname,int page) throws SQLException
    {
    	DBManager dbm = new DBManager();
    	dbm.openConnection();
    	
    	             //----------�õ�uid
    	String sqlQuery = "SELECT userId FROM userlist WHERE userName = " + "\""+uname+"\"";
    	ResultSet rs = dbm.queryDatabase(sqlQuery);
    	
    	int uid = 0;
    	if(rs != null)
    	{
    		while(rs.next())
    		{
    			uid = rs.getInt("userId");
    		}
    	}
    	else
    	{
    		return null;
    	}
    	
    	dbm.closeConnection();
    	
    	
    	updateSql();
		    	
    	           //-----------����
    	int len = 0;  //�ܹ��ж��ٸ���Ʒproduct
    	int oid = -1;
    	for(int i=0; i < list.size(); i++)
    	{
    		if((list.get(i).getUserId()) == uid)
    		{
    			int ooid =list.get(i).getOrderId(); 
    			if(oid != ooid)
    			{
    				oid = ooid;
    				len++;  
    			}
    		}
    	}
   
    	
    	           //----��ֵ
    	Order order[] = new Order[len];
    	int olen = 0;
    	oid = -1;
    	for(int i=0; i < list.size(); i++)
    	{
    		if((list.get(i).getUserId()) == uid)
    		{
    			int ooid =list.get(i).getOrderId(); 
    			if(oid != ooid)
    			{
    				oid = ooid;
    				order[olen] = list.get(i);
        			olen++;
    			}	
    		}
    	}
    	
    	       //---��ҳ����
    	int plen = Math.min(OrderNum,len - (page-1)*OrderNum);
    	Order porder[] = new Order[plen];
    	
    	for(int i=0; i < plen; i++)
    	{
    		porder[i] = order[(page-1)*OrderNum + i];
    	}
    	
    	return porder;
    }
    
    public static Order[] getList(int oid) throws SQLException
    {
    	//updateSql();
    	DBManager dbm = new DBManager();
    	dbm.openConnection();
    	
    	int len = 0;
    	String sqlQuery = "SELECT COUNT(*) as LEN FROM orderlist WHERE orderId = " + oid;
    	ResultSet rs = dbm.queryDatabase(sqlQuery);
    	
    	if(rs != null)
    	{
    		while(rs.next())
    		{
    			len = rs.getInt("LEN");
    		}
    	}
    	else
    	{
    		return null;
    	}
    	
    	
    	Order order[] = new Order[len];   
    	int olen = 0;
        for(int i =0; i < list.size() ; i++)
    	{
        	//System.out.println(list.get(i).getOrderId());
    			if(list.get(i).getOrderId() == oid)
    			{   			
    				order[olen] = list.get(i);
    				olen++;
    			}
    	}
       // System.out.println(len + " " + olen);
        return order;
    	
    }
    
    
   
              //-------------�ܹ�����ҳ
    public static int getPageNum(String uname) throws SQLException
    {
    	DBManager dbm = new DBManager();
    	dbm.openConnection();
    
    	   //----------�õ�uid
    	String sqlQuery = "SELECT userId FROM userlist WHERE userName = " + "\""+uname+"\"";
    	ResultSet rs = dbm.queryDatabase(sqlQuery);
    	
    	int uid = 0;
    	if(rs != null)
    	{
    		while(rs.next())
    		{
    			uid = rs.getInt("userId");
    		}
    	}
    	else
    	{
    		return -1;
    	}
    	
    	dbm.closeConnection();
    	
    	updateSql();
  	         //-----------����
	  	int len = 0;
	  	int oid = -1;
	  	for(int i=0; i < list.size(); i++)
	  	{
	  		if((list.get(i).getUserId()) == uid)
	  		{
	  			int ooid =list.get(i).getOrderId(); 
	  			if(oid != ooid)
	  			{
	  				oid = ooid;
	  				len++;
	  			}
	  		}
	  	}
	  	
  	    return (len + OrderNum -1)/OrderNum;
    }
    
    
    
    
    
}
