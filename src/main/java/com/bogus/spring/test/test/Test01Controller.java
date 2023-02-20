package com.bogus.spring.test.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Test01Controller {

	@ResponseBody
	@RequestMapping("/test")
	public String helloWorld() {
		
		return "Hello World!!";
	}
	
}
