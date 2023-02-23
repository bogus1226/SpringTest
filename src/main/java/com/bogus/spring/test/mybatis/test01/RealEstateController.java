package com.bogus.spring.test.mybatis.test01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bogus.spring.test.mybatis.test01.bo.RealEstateBO;
import com.bogus.spring.test.mybatis.test01.model.RealEstate;

@Controller
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 로 select 하기
	@RequestMapping("/mybatis/test01/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		
		return realEstate;
	}
	
	// 2. 월세 조건 select
	@RequestMapping("/mybatis/test01/2")
	@ResponseBody
	public List<RealEstate> rentPrice(@RequestParam("rentPrice") int rentPrice) {
		List<RealEstate> realEstate = realEstateBO.getRentprice(rentPrice);
		
		return realEstate;
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/mybatis/test01/3")
	@ResponseBody
	public List<RealEstate> propertyInformation(@RequestParam("area") int area, @RequestParam("price") int price) {
		List<RealEstate> realEstate = realEstateBO.getPropertyInformation(area, price);
		
		return realEstate;
	}
}
