package com.game.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.BBSVO;
import com.human.VO.CommentVO;
import com.human.VO.PageVO;
import com.human.VO.memberVO;

@Repository
public class game_DAO implements game_if_DAO{
	
	private static String mapperQuery="com.game.DAO.game_if_DAO";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idchecking(String id) throws Exception {
		return sqlSession.selectOne(mapperQuery+".idchecking",id);
	}
	
	@Override
	public int register(memberVO membervo) throws Exception {
		return sqlSession.insert(mapperQuery+".register",membervo);
	}

	@Override
	public memberVO selectOne(memberVO membervo) throws Exception {
		return sqlSession.selectOne(mapperQuery+".selectOne", membervo);
	}

	@Override
	public void insertboard(BBSVO bbsvo) throws Exception {
		sqlSession.insert(mapperQuery+".insertboard", bbsvo);
	}

	@Override
	public List<BBSVO> selectAll(PageVO pagevo) throws Exception {
		return sqlSession.selectList(mapperQuery+".selectall",pagevo);
	}

	@Override
	public void updatecnt(int vno) throws Exception {
		sqlSession.update(mapperQuery+".cntup",vno);
	}

	@Override
	public BBSVO bbsview(int vno) throws Exception {
		return sqlSession.selectOne(mapperQuery+".bbsview", vno);
	}

	@Override
	public void insertComment(CommentVO cmtvo) throws Exception {
		sqlSession.insert(mapperQuery+".insertcmt", cmtvo);
	}

	@Override
	public List<CommentVO> commentAll(int vno) throws Exception {
		return sqlSession.selectList(mapperQuery+".selectcmt",vno);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		sqlSession.delete(mapperQuery+".deleteBoard",no);
	}

	@Override
	public void updateBoard(BBSVO bbsvo) throws Exception {
		sqlSession.update(mapperQuery+".updateBoard",bbsvo);
	}

	@Override
	public void deletecmt(String cmtno) throws Exception {
		sqlSession.delete(mapperQuery+".deletecmt",cmtno);
	}

	@Override
	public int boardcnt() throws Exception {
		return sqlSession.selectOne(mapperQuery+".boardcnt");
	}

	

	

}
