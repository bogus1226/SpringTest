package com.bogus.spring.test.jsp.test01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bogus.spring.test.jsp.test01.bo.SellerBO;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	@PostMapping("/input")
	@ResponseBody
	public String addUser(
			@RequestParam("nickname") String nickname
			, @RequestParam("url") String profileImage
			, @RequestParam("temperature") double temperature) {
		
		int count = sellerBO.addSeller(nickname, profileImage, temperature);
		
		return "추가 완료 : " + count;
	}
	
	@GetMapping("/insert")
	public String insertSeller() {
		return "jsp/test01";
	}
	
	@GetMapping("/lastseller")
	public String lastSeller() {
		
	}
}
