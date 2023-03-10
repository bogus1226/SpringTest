package com.bogus.spring.test.lifecycle.test02;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/lifecycle/test02")
public class Lifecycle_Test02Conteroller {
		
    
	@RequestMapping ("/1")
	public List<Map<String, Object>> movieResponse() {
		
		List<Map<String, Object>> movieList = new ArrayList<>();
		
		Map<String, Object> movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("title", "기생충");
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 0);
		movie.put("director", "로베르토 베니니");
		movie.put("time", 116);
		movie.put("title", "인생은 아름다워");
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 12);
		movie.put("director", "크리스퍼 놀란");
		movie.put("time", 147);
		movie.put("title", "인셉션");
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 19);
		movie.put("director", "윤종빈");
		movie.put("time", 133);
		movie.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");	
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "프란시스 로렌스");
		movie.put("time", 137);
		movie.put("title", "헝거게임");
		movieList.add(movie);
		
		return movieList;
		
	}
	
	@RequestMapping ("/2")
	public List<UserInfo> userResponse() {
		
		List<UserInfo> userList = new ArrayList<>();
		
		UserInfo userInfo = new UserInfo();
		userInfo.setTitle("안녕하세요 가입인사 드립니다");
		userInfo.setUser("hagulu");
		userInfo.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		userList.add(userInfo);
		
		userInfo = new UserInfo();
		userInfo.setTitle("헐 대박");
		userInfo.setUser("bada");
		userInfo.setContent("오늘 목요일이 었어... 금요일인줄");
		userList.add(userInfo);
		
		userInfo = new UserInfo();
		userInfo.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		userInfo.setUser("dulumary");
		userInfo.setContent("....");
		userList.add(userInfo);
		
		return userList;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<UserInfo> entityResponse() {
		
		UserInfo userInfo = new UserInfo();
		userInfo.setTitle("안녕하세요 가입인사 드립니다");
		userInfo.setUser("hagulu");
		userInfo.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		ResponseEntity<UserInfo> entity = new ResponseEntity(userInfo, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}
	
	
	
	
}
