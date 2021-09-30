package com.star.seat.menu.dto;

import org.springframework.web.multipart.MultipartFile;

public class MenuDto {
	private int num;
	private int storeNum;
	private String storeName;
	private String menuImage;
	private String menuName;
	private String content;
	private int price;
	private String best;
	private String category;
	private MultipartFile imageFile;
	
	public MenuDto() {
		
	}

	public MenuDto(int num, int storeNum, String storeName, String menuImage, String menuName, String content,
			int price, String best, String category, MultipartFile imageFile) {
		super();
		this.num = num;
		this.storeNum = storeNum;
		this.storeName = storeName;
		this.menuImage = menuImage;
		this.menuName = menuName;
		this.content = content;
		this.price = price;
		this.best = best;
		this.category = category;
		this.imageFile = imageFile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getMenuImage() {
		return menuImage;
	}

	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBest() {
		return best;
	}

	public void setBest(String best) {
		this.best = best;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	

	
}
