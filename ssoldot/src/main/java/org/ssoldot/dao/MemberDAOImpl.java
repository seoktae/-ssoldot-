package org.ssoldot.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.ssoldot.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "org.ssoldot.mapper.MemberMapper";

	@Override
	public int insertMember(MemberVO vo) throws Exception {
		return sqlSession.insert(namespace+".insertMember", vo); 
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sqlSession.update(namespace+".update_mypage", vo);
	}

	@Override
	public MemberVO selectMember(String member_id) throws Exception {
		return sqlSession.selectOne(namespace+".selectMember", member_id);
		
	}

	@Override
	public void updatePassword(MemberVO vo) throws Exception {
		sqlSession.update(namespace+".updatePassword", vo);
		
	}

	@Override
	public boolean checkPw(MemberVO vo) throws Exception {
		boolean result = false;
		int count = sqlSession.selectOne(namespace+".checkPw", vo);
		if (count == 1 ) result = true;
		return result;
	}

	@Override
	public void delteMember(MemberVO vo) throws Exception {
		sqlSession.delete(namespace+".deleteMember", vo);
	}

	@Override
	public boolean checkPw(String member_id) throws Exception {
		boolean result = false;
		int count = sqlSession.selectOne(namespace+".checkId", member_id);
		if (count == 1) result = true;
		return result;
	}

	@Override
	public boolean checkNickname(String nickname) throws Exception {
		boolean result = false;
		int count = sqlSession.selectOne(namespace+".checkNickname", nickname);
		if (count == 1) result = true;
		return result;
	}

}
