package com.bogus.spring.test.jsp.test02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.spring.test.jsp.test02.bo.RealtorBO;
import com.bogus.spring.test.jsp.test02.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	Realtor realtor = new Realtor();
	
	@GetMapping("/add")
	public String addRealtor(
//			@RequestParam("office") String office
//			, @RequestParam("phoneNumber") String phoneNumber
//			, @RequestParam("address") String address
//			, @RequestParam("grade") String grade
			@ModelAttribute Realtor realtor
			, Model model) {
		
//		realtor.setOffice(office);
//		realtor.setPhoneNumber(phoneNumber);
//		realtor.setAddress(address);
//		realtor.setGrade(grade);
		
		realtorBO.addRealtorObject(realtor);
		
		model.addAttribute("realtor", realtor);
		
		return "jsp/realtorInfo";
	}

	@GetMapping("/input")
	public String inputRealtor() {
		 return "jsp/inputRealtor";
	}
	
}
