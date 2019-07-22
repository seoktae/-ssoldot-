package org.ssoldot.service;

import java.util.List;
import java.util.Map;

import org.ssoldot.domain.BoardReplyVO;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.domain.FileVO;

public interface BoardService {

	public void regist(BoardVO board)throws Exception;
	
	public BoardVO read(Integer b_id)throws Exception;
	
	public void modify(BoardVO board)throws Exception;
	
	public void remove(Integer b_id)throws Exception; 
	
	public List<BoardVO> listAll(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
//	public void registReply(BoardReplyVO rvo)throws Exception;
	
	public BoardReplyVO selectBoardReplyParent(Integer b_id)throws Exception;
	
	public void insertBoardFirst(BoardReplyVO rvo)throws Exception;
	
	public void updateReplySetting(BoardReplyVO rvo)throws Exception;
	
	public void insertBoardAfter(BoardReplyVO rvo)throws Exception;
	
	public List<BoardReplyVO> selectComment(Integer b_id) throws Exception;
	
//	public FileVO selectUserFile(FileVO fvo)throws Exception;
	
	public List<FileVO> selectUserFile(Map<String, Object> mapParameter) throws Exception;
	
	
	
}
