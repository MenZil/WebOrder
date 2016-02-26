package WebOrder.model;

public class Product {

	    //----------产品信息
	private int productId;
	private String productName;
	private int productPrice;
	private int productWeight;
	private String productDescription;
	private String productImages;
	private int productSCount; //购物车数量，不是库存
	
	public Product(){}
	
	
	   //----set && get 方法
	public void SetProductId(int id)
	{
		this.productId = id;
	}
	
	public int GetProductId()
	{
		return this.productId;
	}
	
	public void SetProductName(String name)
	{
		this.productName  = name;
	}
	
	public String GetProductName()
	{
		return this.productName;
	}
	
	public void SetProductPrice(int price)
	{
		this.productPrice = price;
	}
	
	public int GetProductPrice()
	{
		return this.productPrice;
	}
	
	public void SetProductWeight(int weight)
	{
		this.productWeight = weight;
	}
	
	public int GetProductWeight()
	{
		return this.productWeight;
	}
	
	public void SetProductDescription(String description)
	{
		this.productDescription = description;
	}
	
	public String GetProductDescription()
	{
		return this.productDescription;
	}
	
	public void SetProductImages(String images)
	{
		this.productImages = images;
	}
	
	public String GetProductImages()
	{
		return this.productImages;
	}
	
	public void SetProductSCount(int count)
	{
		this.productSCount = count;
	}
	
	public int GetProductSCount()
	{
		return this.productSCount;
	}
	
}




