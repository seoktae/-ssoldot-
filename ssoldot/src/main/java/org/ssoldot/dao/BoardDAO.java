package org.ssoldot.dao;

import java.util.List;

import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(Integer b_id)throws Exception;

	public void update(BoardVO vo) throws Exception;
	
	public void delete(Integer b_id)throws Exception;
	
	public List<BoardVO> listAll(Criteria cri ) throws Exception;
	
	public int countPaging(Criteria cri ) throws Exception;
	
	public void updateViewCnt(Integer b_id)throws Exception;
	
}
