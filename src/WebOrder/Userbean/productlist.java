package WebOrder.Userbean;

import java.util.ArrayList;
import java.util.List;


import java.sql.ResultSet;
import java.sql.SQLException;



import WebOrder.DB.DBManager;
import WebOrder.model.Product;

public class productlist {
            private static List<Product> list = new ArrayList<Product>();
            private static final int  PageNum = 16;
            
                //-------------从数据库中获取信息
            static
            {
            	DBManager db = new DBManager();
            	String sqlQuery = "SELECT * FROM productlist";
            	
            	db.openConnection();
            	ResultSet rs = db.queryDatabase(sqlQuery);
            	
            	try {
					while(rs.next())
					{
						Product p = new Product();
						p.SetProductId(rs.getInt("productId"));
						p.SetProductName(rs.getString("productName"));
						p.SetProductPrice(rs.getInt("productPrice"));
						p.SetProductWeight(rs.getInt("productWeight"));
						p.SetProductDescription(rs.getString("productDescription"));
						p.SetProductImages(rs.getString("productImages"));
						
						list.add(p);
						
					}
					db.closeConnection();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
            }
            
              //-------得到所有产品列表
            public static List<Product> GetList()
            {
            	return list;
            }
            
              //--------------得到某page的相关产品
            public static Product[] GetList(int page)
            {
            	int size = list.size();
            	int len = Math.min(PageNum,size - (page-1)*PageNum);
            	Product product[] = new Product[len];
            	for(int i=0; i< len; i++)
            	{
            		product[i] = list.get((page-1)*PageNum + i);
            	}
            	return product;
            }
            
               //----根据产品ID得到产品信息
            public static  Product FindById(String id)
            {
            	int PID = Integer.parseInt(id);
            
            	for(Product pd : list)
            	{
            		if(PID == pd.GetProductId())
            		{
            			return pd;
            		}
            	}
            	return null;
            }
            public   Product FindId(String id)
            {
            	int PID = Integer.parseInt(id);
            	
            	for(Product pd : list)
            	{
            		if(PID == pd.GetProductId())
            		{
            			return pd;
            		}
            	}
            	return null;
            }
            
             //------计算总共有多少页
            public static int getSumPage(){
    	        String sql = "SELECT count(*) as rownums  FROM productlist";
    	        
    	        DBManager db = new DBManager();
    	        db.openConnection();
    	        ResultSet rs = db.queryDatabase(sql);
    	        try {
    	            if(rs.next())
    	            {
    	             
    	                int row = rs.getInt("rownums");
    	                db.closeConnection();
    	                return (row+PageNum-1)/PageNum;
    	            }
    	            else 
    	            {
    	            	db.closeConnection();
    	                return -1;
    	            }
    	           
    	        } catch (SQLException ex) {
    	            ex.printStackTrace();
    	            return -1;
    	        }
            }
}
