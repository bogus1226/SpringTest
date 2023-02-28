package com.bogus.spring.test.jsp.test02.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RealtorDAO {

	public int insertRealtor(
			@Param("office") String office
			,@Param("phoneNumber") String phoneNumber
			,@Param("address") String address
			,@Param("grade") String grade);
}
