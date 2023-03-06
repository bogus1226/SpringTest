package com.bogus.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.spring.test.jstl.dao.WeatherhistoryDAO;
import com.bogus.spring.test.jstl.model.Weatherhistory;

@Service
public class WeatherhistoryBO {
	
	@Autowired 
	private WeatherhistoryDAO weatherhistoryDAO;

	// 날씨화면 출력을 위한 BO입니다!
	public List<Weatherhistory> getWeatherhistory() { 
		return weatherhistoryDAO.selectWeatherhistoryList();
	}
	
	// 날씨 입력을 위한 BO입니다!
	public int addWeatherhistory(
			String date
			, String weather
			, String microDust
			, double temperatures
			, double precipitation
			, double windSpeed) {
		return weatherhistoryDAO.insertWeatherhistory(date, weather, microDust, temperatures, precipitation, windSpeed);
	}
	
}
