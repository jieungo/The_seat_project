package com.star.seat.order.dto;

public class OrderDto {
	private int orderNum;
	private String email;
	private String storeName;
	private String storeLogo;
	private int num;
	private int tableNum;
	private String menu;
	private int menuCount;
	private int price;
	private int amount;
	private String reviewExist;
	private String confirm;
	private String cancel;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	
	public OrderDto () {}

	public OrderDto(int orderNum, String email, String storeName, String storeLogo, int num, int tableNum, String menu,
			int menuCount, int price, int amount, String reviewExist, String confirm, String cancel, String regdate,
			int startRowNum, int endRowNum) {

		super();
		this.orderNum = orderNum;
		this.email = email;
		this.storeName = storeName;
		this.storeLogo = storeLogo;
		this.num = num;
		this.tableNum = tableNum;
		this.menu = menu;
		this.menuCount = menuCount;
		this.price = price;
		this.amount = amount;
		this.reviewExist = reviewExist;
		this.confirm = confirm;
		this.cancel = cancel;
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

	public String getStoreLogo() {
		return storeLogo;
	}

	public void setStoreLogo(String storeLogo) {
		this.storeLogo = storeLogo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getReviewExist() {
		return reviewExist;
	}

	public void setReviewExist(String reviewExist) {
		this.reviewExist = reviewExist;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
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
