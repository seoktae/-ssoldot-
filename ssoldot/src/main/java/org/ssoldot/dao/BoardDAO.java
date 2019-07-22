package org.ssoldot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ssoldot.domain.BoardReplyVO;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.domain.FileVO;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(Integer b_id)throws Exception;

	public void update(BoardVO vo) throws Exception;
	
	public void delete(Integer b_id)throws Exception;
	
	public List<BoardVO> listAll(Criteria cri ) throws Exception;
	
	public int countPaging(Criteria cri ) throws Exception;
	
	public void updateViewCnt(Integer b_id)throws Exception;
	
//	public void registReply(BoardReplyVO rvo)throws Exception;
	
	public BoardReplyVO selectBoardReplyParent(Integer b_id)throws Exception;
	
	public void insertBoardFirst(BoardReplyVO rvo)throws Exception;
	
	public void updateReplySetting(BoardReplyVO rvo)throws Exception;
	
	public void insertBoardAfter(BoardReplyVO rvo) throws Exception;
	
	public List<BoardReplyVO> selectComment(Integer b_id) throws Exception;
	
//	public List<HashMap<?, ?>> selectUserFile()throws Exception;
	
	public List<FileVO> selectUserFile(Map<String, Object> mapParameter) throws Exception;
	
	
}
