package com.bogus.spring.test.jsp.test01.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.jsp.test01.dao.SellerDAO;
import com.bogus.spring.test.jsp.test01.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	public int addSeller(String nickname, String profileImage, double temperature) {
		return sellerDAO.insertSeller(nickname, profileImage, temperature);
	}
	
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public Seller getIdSeller(int id) {
		return sellerDAO.selectIdSeller(id);
	}
}
