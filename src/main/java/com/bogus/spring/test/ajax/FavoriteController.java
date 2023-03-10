package com.bogus.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bogus.spring.test.ajax.bo.FavoriteBO;
import com.bogus.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/list")
	public String favoriteList(Model model) {
		
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "ajax/favorite/list";
	}
	
	// 사이트 이름과 주소를 전달 받고, 데이터를 저장
	// 성공 실패 여부를 response로 전달한다.
	// 데이터의 형태는 일반적으로 json
	@PostMapping("/add")
	@ResponseBody // json 활용을위해 ResponseBody 적용
	public Map<String, String> addFavorite(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			, Model model) {
		
		int count = favoriteBO.addFavorite(name, url);
		// 성공 : {"result": "success"}
		// 실패 : {"result": "fail"}
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/input")
	public String inputFavorite() {
		
		return "ajax/favorite/input";
	}
	
	@PostMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean> is_duplicateUrl(@RequestParam("url") String url) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
//		if(favoriteBO.isDuplicateEmail(url)) {
//			resultMap.put("is_duplicate", true);
//		} else {
//			resultMap.put("is_duplicate", false);
//		}
		
		resultMap.put("is_duplicate", favoriteBO.isDuplicateEmail(url));
			
		return resultMap;
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteFavorite(@RequestParam("id") int id) {
		
		Map<String, String> resultMap = new HashMap<>();
		int count = favoriteBO.deleteFavorite(id);
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
