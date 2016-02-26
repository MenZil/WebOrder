package WebOrder.model;


import java.util.ArrayList;
import java.util.List;

import WebOrder.Userbean.productlist;
import WebOrder.model.Product;

public class Shop {

	public static List<Product> slist = new ArrayList<Product>(); 
	double total = 0;
	
	       //-----根据产品ID添加到购物车
	public void AddtoShoppingCart(String PID,String Num)
	{
		Product pd = productlist.FindById(PID);
		int num = Integer.parseInt(Num);
		if(pd != null)
		{
			AddtoShoppingCart(pd,num);
		}
	}
	
	
	        //-----查找购物车中是否有相同产品
	private Product Find(Product pd)
	{
		int PID = pd.GetProductId();
		for(int i = 0; i < slist.size(); i++)
		{
			Product pt = slist.get(i);
			if(pt.GetProductId() == PID )
			{
				return pt;
			}
		}
		return null;
	}
	
	   //----添加到slist中
	public void AddtoShoppingCart(Product pd,int num)
	{
		 Product pt = Find(pd);
		 
		 if(pt == null)//购物车中没有此产品
		 {
			 pd.SetProductSCount(num);
			 slist.add(pd);
			 total += pd.GetProductPrice()*num;
		 }
		 else
		 {
			 pd.SetProductSCount(pd.GetProductSCount() + num);
			 total += pd.GetProductPrice()*num;
		 }
		 
	}
	
	public List<Product> GetSList()
	{
		return slist;
	}
	
	     //----从购物车中删除一件产品
	public void delete(String PID)
	{
		for(int i = 0; i <slist.size(); i++)
		{
			Product pt = slist.get(i);
			if(pt.GetProductId() == Integer.parseInt(PID))
			{
				slist.remove(i);
				return ;
			}
		}
	}
	
	   //------清空购物车
	public void ClearAll()
	{
		slist.clear();
		total = 0;
	}
	
	public double getTotal()
	{
		return total;
	}
}
