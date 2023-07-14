package com.reboard.model;

import java.sql.Timestamp;

public class ReBoardVO {
	private int accno;
	private int booked_room_count;
	private int recode;
	private String room_type;	
	Timestamp check_in_date;
	Timestamp check_out_date;
	private int hotelno;
	private String hotelname;
	
	public ReBoardVO() {
		super();
	}

	public ReBoardVO(int accno, int booked_room_count, int recode, String room_type, Timestamp check_in_date,
			Timestamp check_out_date, int hotelno, String hotelname) {
		super();
		this.accno = accno;
		this.booked_room_count = booked_room_count;
		this.recode = recode;
		this.room_type = room_type;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.hotelno = hotelno;
		this.hotelname = hotelname;
	}

	public int getAccno() {
		return accno;
	}

	public void setAccno(int accno) {
		this.accno = accno;
	}

	public int getBooked_room_count() {
		return booked_room_count;
	}

	public void setBooked_room_count(int booked_room_count) {
		this.booked_room_count = booked_room_count;
	}

	public int getRecode() {
		return recode;
	}

	public void setRecode(int recode) {
		this.recode = recode;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public Timestamp getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(Timestamp check_in_date) {
		this.check_in_date = check_in_date;
	}

	public Timestamp getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(Timestamp check_out_date) {
		this.check_out_date = check_out_date;
	}

	public int getHotelno() {
		return hotelno;
	}

	public void setHotelno(int hotelno) {
		this.hotelno = hotelno;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	@Override
	public String toString() {
		return "ReBoardVO [accno=" + accno + ", booked_room_count=" + booked_room_count + ", recode=" + recode
				+ ", room_type=" + room_type + ", check_in_date=" + check_in_date + ", check_out_date=" + check_out_date
				+ ", hotelno=" + hotelno + ", hotelname=" + hotelname + "]";
	}
	
	
	
	
}
