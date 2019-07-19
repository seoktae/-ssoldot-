package org.ssoldot.service;

import org.ssoldot.domain.MemberVO;

public interface MemberService {
	
	public void insertMember(MemberVO member) throws Exception;

	public void updatMember(MemberVO member) throws Exception;

	public MemberVO selectmember(String member_id) throws Exception;

	public void updatePassword(MemberVO member) throws Exception;

	public boolean checkPw(MemberVO member) throws Exception;

	public void deleteMember(MemberVO member) throws Exception;

}
