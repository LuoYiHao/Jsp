package entity;

public class Items {
	private int id;
	private String name;
	private String cityname;
	private int price;
	private int number;
	private String picture;

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

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Items(int id, String name, String cityname, int price, int number, String picture) {
		super();
		this.id = id;
		this.name = name;
		this.cityname = cityname;
		this.price = price;
		this.number = number;
		this.picture = picture;
	}
	
	public Items(){
		
	}
}
