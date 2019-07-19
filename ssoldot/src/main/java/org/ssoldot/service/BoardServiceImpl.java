package org.ssoldot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(Integer b_id) throws Exception {
		dao.updateViewCnt(b_id);
		return dao.read(b_id);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(Integer b_id) throws Exception {
		dao.delete(b_id);
	}

	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		return dao.listAll(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	
}
