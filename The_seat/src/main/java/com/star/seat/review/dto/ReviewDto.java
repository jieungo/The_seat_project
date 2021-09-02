package com.star.seat.review.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {
	// fields
	private int num;
	private int storeNum;
	private String storeName;
	private String writer;
	private String content;
	private int star;
	private int targetNum;
	private String imagePath;
	private String regdate;
	private MultipartFile imageFile;
	
	// default constructor
	public ReviewDto() {
		
	}

	public ReviewDto(int num, int storeNum, String storeName, String writer, String content, int star, int targetNum,
			String imagePath, String regdate, MultipartFile imageFile) {
		super();
		this.num = num;
		this.storeNum = storeNum;
		this.storeName = storeName;
		this.writer = writer;
		this.content = content;
		this.star = star;
		this.targetNum = targetNum;
		this.imagePath = imagePath;
		this.regdate = regdate;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getTargetNum() {
		return targetNum;
	}

	public void setTargetNum(int targetNum) {
		this.targetNum = targetNum;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}


}
