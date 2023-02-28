package com.bogus.spring.test.jsp.test02.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.jsp.test02.dao.RealtorDAO;

@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;
	
	public int addRealtor(String office, String phoneNumber, String address, String grade) {
		return realtorDAO.insertRealtor(office, phoneNumber, address, grade);
	}
}
