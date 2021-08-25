package com.star.seat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "mypage";
	}
}
