package org.ssoldot.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.ssoldot.domain.BoardReplyVO;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.domain.FileVO;
import org.ssoldot.dao.BoardDAO;
import org.ssoldot.dao.UploadDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public void regist(BoardVO board) throws Exception {
		bdao.create(board);
	}

	@Override
	public BoardVO read(Integer b_id) throws Exception {
		bdao.updateViewCnt(b_id);
		return bdao.read(b_id);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		bdao.update(board);
	}

	@Override
	public void remove(Integer b_id) throws Exception {
		bdao.delete(b_id);
	}

	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		return bdao.listAll(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return bdao.countPaging(cri);
	}
/*
	@Override
	public void registReply(BoardReplyVO boardReplyVO) throws Exception {
		return dao.registReply(boardReplyVO);
	}*/

	@Override
	public BoardReplyVO selectBoardReplyParent(Integer b_id) throws Exception {
		return bdao.selectBoardReplyParent(b_id);
	}

	@Override
	public void insertBoardFirst(BoardReplyVO rvo) throws Exception {
		bdao.insertBoardFirst(rvo);
	}

	@Override
	public void updateReplySetting(BoardReplyVO rvo) throws Exception {
		bdao.updateReplySetting(rvo);
	}

	@Override
	public void insertBoardAfter(BoardReplyVO rvo) throws Exception {
		bdao.insertBoardAfter(rvo);
	}

	@Override
	public List<BoardReplyVO> selectComment(Integer b_id) throws Exception {
		return bdao.selectComment(b_id);
	}

	@Override
	public List<FileVO> selectUserFile(Map<String, Object> mapParameter) throws Exception {
		return bdao.selectUserFile(mapParameter);
	}

}
