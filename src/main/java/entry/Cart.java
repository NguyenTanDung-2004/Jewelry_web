package entry;

public class Cart extends Product{
	private int id_cart;
	private int quantity;
	private float size;
	
	public Cart() {}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getSize() {
		return size;
	}

	public void setSize(float size) {
		this.size = size;
	}

	public int getId_cart() {
		return id_cart;
	}

	public void setId_cart(int id_cart) {
		this.id_cart = id_cart;
	}
}
