package com.room.model;

import java.sql.Timestamp;

public class RemainedRoomVO {
	private int typeno;
	private String room_type;
	private int hotelNo;
	private int remained_room;
	private Timestamp ask_date;
	
	public RemainedRoomVO() {
		super();
	}

	public RemainedRoomVO(int typeno, String room_type, int hotelNo, int remained_room, Timestamp ask_date) {
		super();
		this.typeno = typeno;
		this.room_type = room_type;
		this.hotelNo = hotelNo;
		this.remained_room = remained_room;
		this.ask_date = ask_date;
	}

	public int getTypeno() {
		return typeno;
	}

	public void setTypeno(int typeno) {
		this.typeno = typeno;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public int getRemained_room() {
		return remained_room;
	}

	public void setRemained_room(int remained_room) {
		this.remained_room = remained_room;
	}

	public Timestamp getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(Timestamp ask_date) {
		this.ask_date = ask_date;
	}

	@Override
	public String toString() {
		return "RemainedRoomVO [typeno=" + typeno + ", room_type=" + room_type + ", hotelNo=" + hotelNo
				+ ", remained_room=" + remained_room + ", ask_date=" + ask_date + "]";
	}

}
