package com.star.seat.seat.dto;

public class SeatDto {
	private int num;
	private String seatImage;
	private String seatContent;
	private String totalSeat;
	private String emptySeat;
	private String notEmptySeat;
	private String notUse;
	
	public SeatDto() {
		
	}

	public SeatDto(int num, String seatImage, String seatContent, String totalSeat, String emptySeat,
			String notEmptySeat, String notUse) {
		super();
		this.num = num;
		this.seatImage = seatImage;
		this.seatContent = seatContent;
		this.totalSeat = totalSeat;
		this.emptySeat = emptySeat;
		this.notEmptySeat = notEmptySeat;
		this.notUse = notUse;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSeatImage() {
		return seatImage;
	}

	public void setSeatImage(String seatImage) {
		this.seatImage = seatImage;
	}

	public String getSeatContent() {
		return seatContent;
	}

	public void setSeatContent(String seatContent) {
		this.seatContent = seatContent;
	}

	public String getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(String totalSeat) {
		this.totalSeat = totalSeat;
	}

	public String getEmptySeat() {
		return emptySeat;
	}

	public void setEmptySeat(String emptySeat) {
		this.emptySeat = emptySeat;
	}

	public String getNotEmptySeat() {
		return notEmptySeat;
	}

	public void setNotEmptySeat(String notEmptySeat) {
		this.notEmptySeat = notEmptySeat;
	}

	public String getNotUse() {
		return notUse;
	}

	public void setNotUse(String notUse) {
		this.notUse = notUse;
	}

	
}
