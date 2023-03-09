package com.bogus.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.ajax.model.Favorite;

@Repository
public interface FavoriteDAO {
	
	public List<Favorite> selectFavoriteList();
	
	public int insertFavorite(
			@Param("name") String name
			, @Param("url") String url);

	public int selectCountEmail(@Param("url") String url);
}
