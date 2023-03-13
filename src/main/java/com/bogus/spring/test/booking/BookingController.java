package com.bogus.spring.test.booking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bogus.spring.test.booking.bo.BookingBO;
import com.bogus.spring.test.booking.model.Booking;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/search")
	public String bookingSearch() {
		
		return "ajax/booking/search";
	}
	
	@GetMapping("/list")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "ajax/booking/list";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, Boolean> deleteBooking(@RequestParam("id") int id) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
	
		resultMap.put("result", bookingBO.deleteBooking(id));
		
		return resultMap;
	}
	
	@GetMapping("/reservation")
	public String bookingReservation() {
		 
		return "ajax/booking/reservation";
	}
	
	@GetMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addBooking(
			@RequestParam("name") String name
			, @RequestParam("headcount") int headcount
			, @RequestParam("day") int day
			, @DateTimeFormat(pattern="yy년 MM월 d일") 
				@RequestParam("date") Date date
			, @RequestParam("phoneNumber") String phoneNumber) throws ParseException {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("result", bookingBO.addBooking(name, headcount, day, date, phoneNumber));
		
		return resultMap;	
	}
	
	@GetMapping("/searchList")
	@ResponseBody
	public Map<String, Object> searchBookingList(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Booking searchBookingList = bookingBO.getSeachBookingList(name, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		if(searchBookingList != null) {
			result.put("result", "success");
			result.put("booking", searchBookingList);
		} else{
			result.put("result", "false");
		} 
		
		return result;
	}
	
}
