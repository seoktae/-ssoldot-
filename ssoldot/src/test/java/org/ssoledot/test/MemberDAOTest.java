package org.ssoledot.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssoldot.dao.MemberDAO;
import org.ssoldot.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {
	
	@Inject
	private MemberDAO dao;
	
	@Test
	public void testInsertMember()throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMember_id("test@test.com");
		vo.setPassword("test");
		vo.setNickname("test");
		vo.setSt_picname("ss");
		vo.setOr_picname("dd");
		vo.setPwd_que("좋아하는 음식?");
		vo.setPwd_ans("ㅎㅎ");
		
		dao.insertMember(vo);
	}



}
