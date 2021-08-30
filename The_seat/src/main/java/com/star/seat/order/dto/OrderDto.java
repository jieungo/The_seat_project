package com.star.seat.order.dto;

public class OrderDto {
	private int orderNum;
	private String email;
	private String storeName;
	private int tableNum;
	private String menu;
	private int menuCount;
	private int price;
	private int amount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	
	public OrderDto () {}

	public OrderDto(int orderNum, String email, String storeName, int tableNum, String menu, int menuCount, int price,
			int amount, String regdate, int startRowNum, int endRowNum) {
		super();
		this.orderNum = orderNum;
		this.email = email;
		this.storeName = storeName;
		this.tableNum = tableNum;
		this.menu = menu;
		this.menuCount = menuCount;
		this.price = price;
		this.amount = amount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public int getTableNum() {
		return tableNum;
	}

	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getMenuCount() {
		return menuCount;
	}

	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}
