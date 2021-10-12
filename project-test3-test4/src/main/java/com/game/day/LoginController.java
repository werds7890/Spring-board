package com.game.day;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.game.Service.game_if_service;
import com.human.VO.memberVO;

@Controller
public class LoginController {
	
	@Inject
	private game_if_service Game_if_service;
	
	@RequestMapping(value = "loginuser", method = RequestMethod.POST)
	public String loginform(memberVO membervo, HttpServletRequest request, Model model) throws Exception{
		System.out.println(membervo.getId());
		System.out.println(membervo.getPass());
		memberVO mm=Game_if_service.selectOne(membervo);
		if(mm!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("userid", mm.getId());
			System.out.println("loginok");
		}
		return "home";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginchek(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();// 모든 세션, 현재 쿠키값으로 설정되어있는 지운다.
		return "home";
	}
}
