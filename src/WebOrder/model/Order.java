package WebOrder.model;

public class Order {
 
	          //--------订单信息
	private int orderId;
	private String orderDate;
	private int productCount;
	private String shipmode;
	private int cost;
	private int userId;
	private int productId;
	
	
	          //--------set() && get() 方法
	public void setOrderId(int oid)
	{
		orderId = oid;
	}
	public int getOrderId()
	{
		return orderId;
	}
	
	
	public void setOrderDate(String odate)
	{
		orderDate = odate;
	}
	public String getOrderDate()
	{
		return orderDate;
	}
	
	
	
	public void setProductCount(int pcount)
	{
		productCount = pcount;
	}
	public int getProductCount()
	{
		return productCount;
	}
	
	
	
	public void setShipmode(String ship)
	{
		shipmode = ship;
	}
	public String getShipmode()
	{
		return shipmode;
	}
	
	
	public void setCost(int ct)
	{
		cost = ct;
	}
	public int getCost()
	{
		return cost;
	}
	
	
	
	public void setUserId(int uid)
	{
		userId = uid;
	}
	public int getUserId()
	{
		return userId;
	}
	
	
	public void setProductId(int pid)
	{
		productId = pid;
	}
	public int getProductId()
	{
		return productId;
	}
	
}
