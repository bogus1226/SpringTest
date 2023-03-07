package com.bogus.spring.test.jstl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.spring.test.jstl.model.Weatherhistory;


@Repository
public interface WeatherhistoryDAO {

	// 날씨화면 출력을 위한 DAO입니다!
	public List<Weatherhistory> selectWeatherhistoryList();
	
	// 날씨 입력을 위한 DAO입니다!
	public int insertWeatherhistory(@Param("date") String date
			, @Param("weather") String weather
			, @Param("microDust") String microDust
			, @Param("temperatures") double temperatures
			, @Param("precipitation") double precipitation
			, @Param("windSpeed") double windSpeed);
}
