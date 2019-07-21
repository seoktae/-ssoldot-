package org.ssoldot.dao;

import org.ssoldot.domain.MemberVO;

public interface MemberDAO {
	//회원가입
	public int insertMember(MemberVO vo) throws Exception;

	public void updateMember(MemberVO vo) throws Exception;

	public MemberVO selectMember(String member_id) throws Exception;

	public void updatePassword(MemberVO vo) throws Exception;

	public boolean checkPw(MemberVO vo) throws Exception;

	public void delteMember(MemberVO vo) throws Exception;

	public boolean checkPw(String member_id) throws Exception;

	public boolean checkNickname(String nickname) throws Exception;
	

}
