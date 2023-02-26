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
@RequestMapping("/mybatis")
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 로 select 하기
	@RequestMapping("/test01/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		
		return realEstate;
	}
	
	// 2. 월세 조건 select
	@RequestMapping("/test01/2")
	@ResponseBody
	public List<RealEstate> rentPrice(@RequestParam("rentPrice") int rentPrice) {
		List<RealEstate> realEstate = realEstateBO.getRentprice(rentPrice);
		
		return realEstate;
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/test01/3")
	@ResponseBody
	public List<RealEstate> propertyInformation(@RequestParam("area") int area, @RequestParam("price") int price) {
		List<RealEstate> realEstate = realEstateBO.getPropertyInformation(area, price);
		
		return realEstate;
	}
	
	// 1. 객체로 insert 하기
	@RequestMapping("/test02/1")
	@ResponseBody
	public String addRealEstateByObject() {
		
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateBO.addRealEstateByObject(realEstate);
		
		return "입력 성공 : " + count;
	}
	
	// 2. field 로 insert 하기
	@RequestMapping("/test02/2")
	@ResponseBody
	public String addRealEstate(@RequestParam("realtorId") int realtorId) {
		
		
		int count = realEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공 : " + count;
	}
	
	// 1. update
	@RequestMapping("test03/1")
	@ResponseBody
	public String updateRealEstate() {
		
		int count =  realEstateBO.updateRealEstate("전세", 70000, 21);
		
		return "수정 성공 : " + count;
	}
	
	// 1. delete
	@RequestMapping("test04/1")
	@ResponseBody
	public String deleteRealEstate(@RequestParam("id") int id) {
		
		int count = realEstateBO.deleteRealEstate(id);
		
		return "삭제 성공 : " + count;
	}
	
}
