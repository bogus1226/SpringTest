package com.bogus.spring.test.jsp.test02.dao;

import org.springframework.stereotype.Repository;

import com.bogus.spring.test.jsp.test02.model.Realtor;

@Repository
public interface RealtorDAO {

	public int insertRealtorObject(Realtor realtor);
}
