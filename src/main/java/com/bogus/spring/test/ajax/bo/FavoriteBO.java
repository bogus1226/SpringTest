package com.bogus.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.ajax.dao.FavoriteDAO;
import com.bogus.spring.test.ajax.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;

	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}
}
