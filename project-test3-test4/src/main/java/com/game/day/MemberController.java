package com.game.day;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.game.Service.game_if_service;
import com.human.VO.memberVO;

@Controller
public class MemberController {
	@Inject
	private game_if_service Game_if_service;
	
	@RequestMapping(value="member_regi", method=RequestMethod.POST)
	public String memberregi(memberVO membervo, Locale locale, Model model) throws Exception{
		model.addAttribute("newregi", Game_if_service.Register(membervo));
		return "home";
	}
}
