package com.game.day;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.Service.game_if_service;
import com.human.VO.BBSVO;
import com.human.VO.PageVO;
@Controller
public class GameController {
	@Inject
	private game_if_service Game_if_service;
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String home() throws Exception{
		return "home";
	}
	
	@RequestMapping(value="bbs_free", method=RequestMethod.GET)
	public String bbsfree(@ModelAttribute PageVO pageVO, Model model) throws Exception{
		//bbslist view에 pagevo와 게시판 보여줄 게시글개수 모델로 데이터 처리하고 보낸다.
		if (pageVO.getPage() == null) {
			pageVO.setPage(1);// 초기 page변수값 지정
		}
		pageVO.setPerPageNum(5);// 1페이지당 보여줄 게시물 수 강제지정
		pageVO.setTotalCount(Game_if_service.boardcnt());// 게시판총합 파라미터로 넘김

		System.out.println(pageVO.getStartNo() + "/" + pageVO.getPerPageNum());
		model.addAttribute("bbslist", Game_if_service.selectAll(pageVO));
		return "bbs/bbslist";
	}

	@RequestMapping(value="bbs_idchk", method=RequestMethod.POST)
	@ResponseBody
	public int bbschk(@RequestParam("id") String id) throws Exception{
		System.out.println(id);
		return Game_if_service.idcheck(id);
	}
	
	@RequestMapping(value="bbs_write", method=RequestMethod.GET)
	public String write() throws Exception{
		return "bbs/write";
	}
	
	@RequestMapping(value="real_write", method=RequestMethod.POST)
	public String realwrite(BBSVO bbsvo) throws Exception{
		bbsvo.prt();
		Game_if_service.insertboard(bbsvo);
		return "redirect:bbs_free";
	}
	
	@RequestMapping(value="bbs_view", method=RequestMethod.GET)
	public String bbsview(@RequestParam("vno") int vno, Model model) throws Exception{
		Game_if_service.updatecnt(vno);
		BBSVO bbsvo=Game_if_service.bbsview(vno);
		
		model.addAttribute("Dbbsvo", bbsvo);
		model.addAttribute("cmtvo", Game_if_service.commentAll(vno));
		return "bbs/dview";
	}
	
	@RequestMapping(value="bbs_del", method=RequestMethod.GET)
	public String del(@RequestParam("dno") int dno) throws Exception{
		Game_if_service.deleteBoard(dno);
		return "redirect:bbs_free";
	}
	
	@RequestMapping(value="bbs_mod", method=RequestMethod.GET)
	public String bbsmod(@RequestParam("mno") int mno, Model model) throws Exception{		
		model.addAttribute("mno1", mno);
		return "bbs/mod";
	}
	
	@RequestMapping(value="bbs_mod", method=RequestMethod.POST)
	public String bbsmod2(BBSVO bbsvo) throws Exception{	
		Game_if_service.updateBoard(bbsvo);
		return "redirect:bbs_free";
	}

}
