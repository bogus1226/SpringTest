package com.bogus.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.jstl.dao.StoreListDAO;
import com.bogus.spring.test.jstl.model.Review;
import com.bogus.spring.test.jstl.model.StoreList;

@Service
public class StoreListBO {

	@Autowired
	private StoreListDAO storeDAO;
	
	public List<StoreList> getStoreList() {
		return storeDAO.selectStore();
	}
	
	public List<Review> getStoreReview(int id) {
		return storeDAO.selctStoreReview(id);
	}
	
	public List<StoreList> getStoreName(int id) {
		return storeDAO.selectStoreName(id);
	}
}
