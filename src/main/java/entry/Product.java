package entry;

import java.sql.Date;

public class Product {
	private int id;
    private String name;
    private int price;
    private Date date;
    private float discount;
    private String info;
    private String material;

    public Product(int id, String name, int price, Date date, float discount, String info, String material) {
        this.setId(id);
        this.setName(name);
        this.setPrice(price);
        this.setDate(date);
        this.setDiscount(discount);
        this.setInfo(info);
        this.setMaterial(material);
    }

    public Product() {
    	id = 0;
    	name = "";
    	price =0;
    	date = null;
    	discount = 0;
    	info ="";
    	material="";
    }
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

}
