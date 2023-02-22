package com.bogus.spring.test.database.dao;

import java.util.List;

import com.bogus.spring.test.database.model.Store;

public interface StoreDAO {

	public List<Store> selectStoreList();
}
