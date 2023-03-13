package com.bogus.spring.test.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.booking.dao.BookingDAO;
import com.bogus.spring.test.booking.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public boolean deleteBooking(int id) {
		
		int count = bookingDAO.deleteBooking(id);
		
		return count != 0;
	}
	
	public boolean addBooking(
			String name
			, int headcount
			, int day
			, Date date
			, String phoneNumber) {
		
		int count = bookingDAO.insertBooking(name, headcount, day, date, phoneNumber, "대기중");
		
		return count != 0;
	}
	
	public Booking getSeachBookingList(
			String name,
			String phoneNumber) {
		
		return bookingDAO.selectSearchBookingList(name, phoneNumber);	
	}
	
	
	public boolean getCountSearchBookingList(
			String name,
			String phoneNumber) {
		
		int count = bookingDAO.selectCountSearchBookingList(name, phoneNumber);
		
		return count != 0;
	}
	
}
