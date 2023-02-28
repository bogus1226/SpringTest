package com.bogus.spring.test.jsp.test01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bogus.spring.test.jsp.test01.bo.SellerBO;
import com.bogus.spring.test.jsp.test01.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	@PostMapping("/add")
	@ResponseBody
	public String addSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam("url") String profileImage
			, @RequestParam("temperature") double temperature) {
		
		int count = sellerBO.addSeller(nickname, profileImage, temperature);
		
		return "추가 완료 : " + count;
	}
	
	@GetMapping("/input")
	public String insertSeller() {
		return "jsp/inputSeller";
	}
	
	@GetMapping("/lastSeller")
	public String lastSeller(
			Model model
			,@RequestParam(value="id", required=false) Integer id
			) {
		Seller lastSeller = null;
		if(id == null) {
			lastSeller =  sellerBO.getLastSeller();	
		} else {
			lastSeller = sellerBO.getIdSeller(id);
		}
		
		model.addAttribute("seller", lastSeller);
		return "jsp/lastSeller";
	}
}
