package com.root.idme.dto;

public class Product {
	
	public int barcode;
	public String pName;
	public int price;
	public int amount;
	
	public Product() {}

	public int getBarcode() {
		return barcode;
	}

	public void setBarcode(int barcode) {
		this.barcode = barcode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
