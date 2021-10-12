package com.game.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.DAO.game_if_DAO;
import com.human.VO.BBSVO;
import com.human.VO.CommentVO;
import com.human.VO.PageVO;
import com.human.VO.memberVO;

@Service
public class game_service implements game_if_service{
	
	@Inject
	private game_if_DAO Game_if_DAO;
	
	@Override
	public int idcheck(String id) throws Exception {
		return Game_if_DAO.idchecking(id);
	}
	
	@Override
	public int Register(memberVO membervo) throws Exception {
		int cnt=Game_if_DAO.register(membervo);
			if(cnt==1) {
				return 1;
			}else {
				return 0;
			}
	}

	@Override
	public memberVO selectOne(memberVO membervo) throws Exception {
		return Game_if_DAO.selectOne(membervo);
	}

	@Override
	public void insertboard(BBSVO bbsvo) throws Exception {
		Game_if_DAO.insertboard(bbsvo);
	}

	@Override
	public List<BBSVO> selectAll(PageVO pagevo) throws Exception {
		return Game_if_DAO.selectAll(pagevo);
	}

	@Override
	public void updatecnt(int vno) throws Exception {
		Game_if_DAO.updatecnt(vno);
	}

	@Override
	public BBSVO bbsview(int vno) throws Exception {
		return Game_if_DAO.bbsview(vno);
	}

	@Override
	public List<CommentVO> commentAll(int vno) throws Exception {
		return Game_if_DAO.commentAll(vno);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		Game_if_DAO.deleteBoard(no);
	}

	@Override
	public void updateBoard(BBSVO bbsvo) throws Exception {
		Game_if_DAO.updateBoard(bbsvo);
	}

	@Override
	public int boardcnt() throws Exception {
		return Game_if_DAO.boardcnt();
	}

	

}
