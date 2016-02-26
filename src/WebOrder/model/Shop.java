package WebOrder.model;


import java.util.ArrayList;
import java.util.List;

import WebOrder.Userbean.productlist;
import WebOrder.model.Product;

public class Shop {

	public static List<Product> slist = new ArrayList<Product>(); 
	double total = 0;
	
	       //-----���ݲ�ƷID��ӵ����ﳵ
	public void AddtoShoppingCart(String PID,String Num)
	{
		Product pd = productlist.FindById(PID);
		int num = Integer.parseInt(Num);
		if(pd != null)
		{
			AddtoShoppingCart(pd,num);
		}
	}
	
	
	        //-----���ҹ��ﳵ���Ƿ�����ͬ��Ʒ
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
	
	   //----��ӵ�slist��
	public void AddtoShoppingCart(Product pd,int num)
	{
		 Product pt = Find(pd);
		 
		 if(pt == null)//���ﳵ��û�д˲�Ʒ
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
	
	     //----�ӹ��ﳵ��ɾ��һ����Ʒ
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
	
	   //------��չ��ﳵ
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
