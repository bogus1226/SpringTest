package com.bogus.spring.test.mybatis.test01.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.mybatis.test01.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	// 1. id 로 select 하기
	public RealEstate selectRealEstate(@Param("id") int id);
	
	// 2. 월세 조건 select
	public List<RealEstate> selectRentPrice(@Param("rentPrice") int rentPrice);
	
	// 3. 복합조건 select
	public List<RealEstate> selectPropertyInformation(@Param("area") int area, @Param("price") int price);
}
