package com.bogus.spring.test.booking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
			, @RequestParam("date") String date
			, @RequestParam("phoneNumber") String phoneNumber) throws ParseException {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		SimpleDateFormat formmater = new SimpleDateFormat("yy년 MM월 d일");
		
		Date date2 = formmater.parse(date);
		
		resultMap.put("result", bookingBO.addBooking(name, headcount, day, date2, phoneNumber));
		
		return resultMap;	
	}
	
	@GetMapping("/searchCountList")
	@ResponseBody
	public Map<String, Boolean> searchCountBookingList(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("result", bookingBO.getCountSearchBookingList(name, phoneNumber));
		
		return resultMap;
	}
	
	@GetMapping("/searchList")
	@ResponseBody
	public Map<String, Object> searchBookingList(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Booking searchBookingList = bookingBO.getSeachBookingList(name, phoneNumber);
		
		Date date = searchBookingList.getDate();
		SimpleDateFormat formmater = new SimpleDateFormat("yyyy-MM-dd");
		String date2 = formmater.format(date);
		
		
		Map<String, Object> ListMap = new HashMap<>();
		ListMap.put("name", searchBookingList.getName());
		ListMap.put("date", date2);
		ListMap.put("day", searchBookingList.getDay());
		ListMap.put("headcount", searchBookingList.getHeadcount());
		ListMap.put("state", searchBookingList.getState());
		
		return ListMap;
	}
	
}
