package org.ssoldot.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.ssoldot.domain.BoardReplyVO;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.domain.FileVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ssoldot.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public BoardVO read(Integer b_id) throws Exception {
		return session.selectOne(namespace+".read",b_id);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update", vo);
		
	}

	@Override
	public void delete(Integer b_id) throws Exception {
		session.delete(namespace+".delete", b_id);	
		
	}

	@Override
	public void updateViewCnt(Integer b_id) throws Exception {
		session.update(namespace+".updateViewCnt",b_id);
		
	}

	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		return session.selectList(namespace+".listAll",cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging",cri);
	}
/*
	@Override
	public void registReply(BoardReplyVO rvo) throws Exception {
			session.insert(namespace+".registReply",rvo);
	}*/

	@Override
	public BoardReplyVO selectBoardReplyParent(Integer b_id) throws Exception {
		return session.selectOne(namespace+".selectBoardReplyParent", b_id);
	}

	@Override
	public void insertBoardFirst(BoardReplyVO rvo) throws Exception {
		session.insert(namespace+".insertBoardFirst", rvo);
	}

	@Override
	public void updateReplySetting(BoardReplyVO rvo) throws Exception {
		session.update(namespace+".updateReplySetting",rvo);		
	}

	@Override
	public void insertBoardAfter(BoardReplyVO rvo) throws Exception {
		session.insert(namespace+".insertBoardAfter", rvo);
	}

	@Override
	public List<BoardReplyVO> selectComment(Integer b_id) throws Exception {
		return session.selectList(namespace+".selectComment",b_id);
	}

	@Override
	public List<FileVO> selectUserFile(Map<String, Object> mapParameter) throws Exception {
		return session.selectList(namespace+".selectUserFile",mapParameter);
	}


	
}
