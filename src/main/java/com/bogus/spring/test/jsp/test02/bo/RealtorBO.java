package com.bogus.spring.test.jsp.test02.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.jsp.test02.dao.RealtorDAO;
import com.bogus.spring.test.jsp.test02.model.Realtor;

@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;
		
	public int addRealtorObject(Realtor realtor) {
		return realtorDAO.insertRealtorObject(realtor);
	}
}
