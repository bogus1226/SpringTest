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
		
		List<RealEstate> realEstate = realEstateDAO.selectPropertyInformation(area, price);
		
		return realEstate;
	}
}
