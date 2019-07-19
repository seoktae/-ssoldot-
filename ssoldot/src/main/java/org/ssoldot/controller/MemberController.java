package org.ssoldot.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.UUID;

import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.ssoldot.domain.MemberVO;
import org.ssoldot.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	@Inject
	private MemberService service;
	
	
	// 회원가입  컨트롤러 메서드
    @RequestMapping( value="join", method=RequestMethod.GET )
    public String join() {
    	logger.info("get join");
    	return "member/join";
    }
    @RequestMapping( value="join", method=RequestMethod.POST )
    public String join( MemberVO member, MultipartFile file, HttpServletRequest request) throws Exception {
    	
    	
    	logger.info("originalName: " + file.getOriginalFilename());
    	logger.info("size: " + file.getSize());
    	logger.info("contentType: " + file.getContentType());
    	
    	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/member/profile_pic");
    	String savedName = null;
    	String originalFilename = file.getOriginalFilename();
    	System.out.println(originalFilename.length());
    	// 프로필 사진 업로드 안할 시 default 사진적용
    	if (originalFilename.length() == 0) {
			savedName= "default.png";
			originalFilename = "default.png";
		} else {
			savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
		}
    	
		System.out.println("> uploadPath : " + uploadPath);
			
    	member.setOr_picname(originalFilename);
    	member.setSt_picname(savedName);
    	
    	service.insertMember(member);
    	logger.info("join success");
    	return "redirect:../";
    }
    
	// 파일 업로드 저장
    private String uploadFile(String originalFilename, byte[] fileData, String uploadPath) throws IOException {
    	
    	UUID uid = UUID.randomUUID();
    	
    	String savedName = uid.toString() + "_" + originalFilename;
    	
    	File target = new File(uploadPath, savedName);
    	
    	FileCopyUtils.copy(fileData, target);
    	
    	return savedName;
	}
    
    
	//회원 로그인
    @RequestMapping( value="login", method=RequestMethod.GET)
    public String login(HttpServletRequest request) {
    	if (request.getParameter("login_error") == null) {
    		String referrer = request.getHeader("Referer");
    		System.out.println(referrer);
    		request.getSession().setAttribute("prevPage", referrer);
		}
    	
		return "member/login";
    	
    }
    //마이 페이지
    @RequestMapping( value="mypage", method=RequestMethod.GET)
    public String myPage(Principal principal, Model model) throws Exception {
    	String member_id = principal.getName();
    	model.addAttribute("vo", service.selectmember(member_id));
    	logger.info("get mypage");
		return "member/mypage";
    	
    }
    //회원정보수정
    @RequestMapping( value="mypage", method=RequestMethod.POST)
    public String myPage(Principal principal, MemberVO member) throws Exception {
    	member.setMember_id(principal.getName());
    	service.updatMember(member);
    	logger.info("update member");
    	return "redirect:/member/mypage";
    	
    }
    
    //비밀번호 변경
    @RequestMapping( value="modify", method=RequestMethod.GET)
    public String modify() throws Exception {
    	logger.info("get modify");
    	return "member/modify";
    }
    //비밀번호 수정
    @RequestMapping( value="modify", method=RequestMethod.POST)
    public String modify(Principal principal, MemberVO member) throws Exception {
    	System.out.println(principal.getName());
    	member.setMember_id(principal.getName());
    	service.updatePassword(member);
    	logger.info("update password");
    	return "redirect:/member/mypage";
    	
    }
    
    //회원 탈퇴
    @RequestMapping( value="delete", method=RequestMethod.GET)
    public String delete() throws Exception {
    	logger.info("get deletemember");
    	return "member/delete";
    }
    
    @RequestMapping( value="delete", method=RequestMethod.POST)
    public String delete(Principal principal, MemberVO member, Model model) throws Exception {
    	member.setMember_id(principal.getName());
    	boolean result = service.checkPw(member);
    	logger.info("deletemember");
    	if (result) {
			service.deleteMember(member);
			return "redirect:../logout";
		} else {
			model.addAttribute("message", "password_error");
			return "redirect:/member/delete";
		}
    	
    	
    }

}
