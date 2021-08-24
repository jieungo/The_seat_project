package com.star.seat.store.dto;

public class StoreDto {
	private int num;
	private String owner;
	private String storeName;
	private String storeAddr;
	private String storeTag;
	private String openingTime;
	private String image_logo;
	private String image_1;
	private String image_2;
	private String image_3;
	private String image_4;
	private String storeOpen;
	private String regdate;
	
	public StoreDto(int num, String owner, String storeName, String storeAddr, String storeTag, String openingTime,
			String image_logo, String image_1, String image_2, String image_3, String image_4, String storeOpen,
			String regdate) {
		super();
		this.num = num;
		this.owner = owner;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
		this.storeTag = storeTag;
		this.openingTime = openingTime;
		this.image_logo = image_logo;
		this.image_1 = image_1;
		this.image_2 = image_2;
		this.image_3 = image_3;
		this.image_4 = image_4;
		this.storeOpen = storeOpen;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	public String getStoreTag() {
		return storeTag;
	}

	public void setStoreTag(String storeTag) {
		this.storeTag = storeTag;
	}

	public String getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(String openingTime) {
		this.openingTime = openingTime;
	}

	public String getImage_logo() {
		return image_logo;
	}

	public void setImage_logo(String image_logo) {
		this.image_logo = image_logo;
	}

	public String getImage_1() {
		return image_1;
	}

	public void setImage_1(String image_1) {
		this.image_1 = image_1;
	}

	public String getImage_2() {
		return image_2;
	}

	public void setImage_2(String image_2) {
		this.image_2 = image_2;
	}

	public String getImage_3() {
		return image_3;
	}

	public void setImage_3(String image_3) {
		this.image_3 = image_3;
	}

	public String getImage_4() {
		return image_4;
	}

	public void setImage_4(String image_4) {
		this.image_4 = image_4;
	}

	public String getStoreOpen() {
		return storeOpen;
	}

	public void setStoreOpen(String storeOpen) {
		this.storeOpen = storeOpen;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
