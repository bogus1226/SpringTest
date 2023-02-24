package com.bogus.spring.test.mybatis.test01.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.mybatis.test01.dao.RealEstateDAO;
import com.bogus.spring.test.mybatis.test01.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	public RealEstateDAO realEstateDAO;

	// 1. id 로 select 하기
	public RealEstate getRealEstate(int id) {
		
		RealEstate realEstate = realEstateDAO.selectRealEstate(id);
		
		return realEstate;
	}
	
	// 2. 월세 조건 select
	public List<RealEstate> getRentprice(int rentPrice) {
		
		List<RealEstate> realEstate = realEstateDAO.selectRentPrice(rentPrice);
		
		return realEstate;
	}
	
	// 3. 복합조건 select
	public List<RealEstate> getPropertyInformation(int area, int price) {
		
		return realEstateDAO.selectPropertyInformation(area, price);	 
	}
	
	// 1. 객체로 insert 하기
	public int addRealEstateByObject(RealEstate realEstate) {
		
		return realEstateDAO.insertRealEstateByObject(realEstate);
	}
	
	// 2. field 로 insert 하기
	public int addRealEstate(int realtorId, String address, int area, String type, int price, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId, address, area, type, price, rentPrice);
	}
	
}
