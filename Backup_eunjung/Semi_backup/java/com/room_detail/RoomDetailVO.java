package com.room_detail;

public class RoomDetailVO {
	private int roomNo;
	private int typeNo;
	private int totalRoom;
	private int pricePerDay;
	private int bed;
	private int wifi;
	private int kicthen;
	private int ac;
	
	public RoomDetailVO() {
		super();
	}

	public RoomDetailVO(int roomNo, int typeNo, int totalRoom, int pricePerDay, int bed, int wifi, int kicthen,
			int ac) {
		this.roomNo = roomNo;
		this.typeNo = typeNo;
		this.totalRoom = totalRoom;
		this.pricePerDay = pricePerDay;
		this.bed = bed;
		this.wifi= wifi;
		this.kicthen = kicthen;
		this.ac = ac;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getTotalRoom() {
		return totalRoom;
	}

	public void setTotalRoom(int totalRoom) {
		this.totalRoom = totalRoom;
	}

	public int getPricePerDay() {
		return pricePerDay;
	}

	public void setPricePerDay(int pricePerDay) {
		this.pricePerDay = pricePerDay;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getKicthen() {
		return kicthen;
	}

	public void setKicthen(int kicthen) {
		this.kicthen = kicthen;
	}

	public int getAc() {
		return ac;
	}

	public void setAc(int ac) {
		this.ac = ac;
	}

	@Override
	public String toString() {
		return "RoomDetailVO [roomNo=" + roomNo + ", typeNo=" + typeNo + ", totalRoom=" + totalRoom + ", pricePerDay="
				+ pricePerDay + ", bed=" + bed + ", wifi=" + wifi + ", kicthen=" + kicthen + ", ac=" + ac + "]";
	}
	
	

}
