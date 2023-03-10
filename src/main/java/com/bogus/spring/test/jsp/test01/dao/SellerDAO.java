package com.bogus.spring.test.jsp.test01.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.jsp.test01.model.Seller;

@Repository
public interface SellerDAO {

	public int insertSeller(
			@Param("nickname") String nickname
			,  @Param("profileImage") String profileImage
			, @Param("temperature") double temperature);
	
	public Seller selectLastSeller();
	
	public Seller selectIdSeller(@Param("id") int id);
}
