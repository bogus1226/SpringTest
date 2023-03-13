package com.bogus.spring.test.booking.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.booking.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int deleteBooking(@Param("id") int id);
	
	public int insertBooking(
			@Param("name") String name
			, @Param("headcount") int headcount
			, @Param("day") int day
			, @Param("date") Date date
			, @Param("phoneNumber") String phoneNumber
			, @Param("state") String state);
	
	public Booking selectSearchBookingList(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	public int selectCountSearchBookingList(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
}
