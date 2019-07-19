package org.ssoldot.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.ssoldot.dao.MemberDAO;
import org.ssoldot.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;	

	@Override
	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}

	@Override
	public void updatMember(MemberVO member) throws Exception {
		dao.updateMember(member);
		
	}

	@Override
	public MemberVO selectmember(String member_id) throws Exception {
		return dao.selectMember(member_id);
	}

	@Override
	public void updatePassword(MemberVO member) throws Exception {
		dao.updatePassword(member);
		
	}

	@Override
	public boolean checkPw(MemberVO member) throws Exception {
		return dao.checkPw(member);
	}

	@Override
	public void deleteMember(MemberVO member) throws Exception {
		dao.delteMember(member);
	}

}
