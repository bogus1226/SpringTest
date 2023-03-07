package com.bogus.spring.test.jstl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.jstl.model.Review;
import com.bogus.spring.test.jstl.model.StoreList;

@Repository
public interface StoreListDAO {

	public List<StoreList> selectStore();
	
	public List<Review> selctStoreReview(@Param("id") int id);
}
