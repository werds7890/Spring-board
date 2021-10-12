package com.game.DAO;

import java.util.List;

import com.human.VO.BBSVO;
import com.human.VO.CommentVO;
import com.human.VO.PageVO;
import com.human.VO.memberVO;

public interface game_if_DAO {
	public int idchecking(String id) throws Exception;
	public int register(memberVO membervo) throws Exception;
	public memberVO selectOne(memberVO membervo) throws Exception;
	public void insertboard(BBSVO bbsvo) throws Exception;
	public List<BBSVO> selectAll(PageVO pagevo) throws Exception;
	public void updatecnt(int vno) throws Exception;
	public BBSVO bbsview(int vno) throws Exception;
	public void insertComment(CommentVO cmtvo) throws Exception;
	public List<CommentVO> commentAll(int vno) throws Exception;
	public void deleteBoard(int no) throws Exception;
	public void updateBoard(BBSVO bbsvo) throws Exception;
	public void deletecmt(String cmtno) throws Exception;
	public int boardcnt() throws Exception;
	
	
}
