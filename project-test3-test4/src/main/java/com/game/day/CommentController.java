package com.game.day;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.DAO.game_if_DAO;
import com.game.Service.game_if_service;
import com.human.VO.CommentVO;

@Controller
public class CommentController {
	
	@Inject
	private game_if_DAO Game_if_DAO;
	
	@RequestMapping(value="comment_input", method=RequestMethod.POST)
	public String commenet(CommentVO cmtvo, Model model) throws Exception {
		Game_if_DAO.insertComment(cmtvo);
		model.addAttribute("vno", cmtvo.getNo());	//게시글번호를 bbsview컨트롤러로 다시보낸다.
		return "redirect:bbs_view";
	}
	
	@RequestMapping(value="cmt_del", method=RequestMethod.POST)
	@ResponseBody
	public String cmtdel(@RequestParam("cmtno") String cmtno) throws Exception{
		System.out.println(cmtno);
		Game_if_DAO.deletecmt(cmtno);
		return cmtno;
	}
}
