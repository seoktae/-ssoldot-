package org.ssoldot.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.ssoldot.domain.EmailSender;
import org.ssoldot.domain.EmailVO;
import org.ssoldot.domain.MemberVO;
import org.ssoldot.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private EmailVO email;
	
	@Inject
	private MemberService service;
	
	
	// 회원가입 
    @RequestMapping( value="join", method=RequestMethod.GET )
    public String join() {
    	logger.info("get join");
    	return "member/join";
    }
    //아이디 중복 체크
    @RequestMapping(value="check_id", method=RequestMethod.POST)
    @ResponseBody
    public boolean check_id(@RequestParam("member_id") String member_id, HttpServletResponse response) throws Exception {
    	//회원 아이디 중복체크
    	boolean check_id = service.checkId(member_id);
    	return check_id;
    }
    
    //닉네임 중복 체크
    @RequestMapping(value="check_nickname", method=RequestMethod.POST)
    @ResponseBody
    public boolean check_nickname(@RequestParam("nickname") String nickname, HttpServletResponse response) throws Exception {
    	//닉네임 중복체크
    	System.out.println(nickname);
    	boolean check_nickname = service.checkNickname(nickname);
    	return check_nickname;
    }
    
    
    //회원가입 
    @RequestMapping( value="join", method=RequestMethod.POST )
    public String join( MemberVO member, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	
    	logger.info("originalName: " + file.getOriginalFilename());
    	logger.info("size: " + file.getSize());
    	logger.info("contentType: " + file.getContentType());
    	
    	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/member/profile_pic");
    	String savedName = null;
    	String originalFilename = file.getOriginalFilename();
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
    	//고유식별자 생성
    	UUID uid = UUID.randomUUID();	
    	//생성한 고유식별자+파일이름
    	String savedName = uid.toString() + "_" + originalFilename;
    	//uplodPath 경로에 파일저장
    	File target = new File(uploadPath, savedName);
    	System.out.println(uploadPath);
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
    //비밀번호 찾기
    @RequestMapping( value="find_pw", method=RequestMethod.GET)
    public String find_pw() {
    	return "member/find_pw";
    	
    }
    
    @RequestMapping( value="find_pw", method=RequestMethod.POST)
    public String find_pw(@RequestParam("member_id") String member_id, HttpServletResponse response) throws Exception {
    	//입력한 비밀번호 확인
    	System.out.println(member_id);
    	boolean result = service.checkId(member_id);
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	if (result) {
    		//임시 비밀번호 생성
    		UUID uid = UUID.randomUUID();
    		String password = uid.toString().replace("-", "").substring(0, 8);
    		//임시 비밀번호로 수정
    		MemberVO member = new MemberVO();
    		member.setMember_id(member_id);
    		member.setPassword(password);
    		service.updatePassword(member);
    		//이메일 전송
    		String content = content(member);
    		System.out.println(content);
    		email.setSubject("임시 비밀번호 메일입니다.");
    		email.setReceiver(member.getMember_id());
    		email.setContent(content);
    		emailSender.SendEmail(email);
    		out.print("이메일로 임시 비밀번호를 발송하였습니다.");
    		out.close();
		} else {
			out.print("검색하신 내용은 찾을 수 없습니다. 다시 확인해 주세요.");
			out.close();			
		}	
		return "member/find_pw";
    	
    }
    
    //메일내용
    private String content(MemberVO member) {
    	StringBuffer content = new StringBuffer();
    	content.append("<div style=\"max-width: 630px; margin: 0 auto; text-align: center\">");
    	content.append("<div style=\"max-width: 630px; margin: 0 auto; text-align: center\">");
    	content.append("<div class=\"adM\">");
    	content.append("<div style=\"padding-top: 40px; font-size: 28px; color: #383838\">");
    	content.append("<span class=\"il\">임시 비밀번호</span> 발급");
    	content.append("</div>");
    	content.append("<div style=\"max-width: 500px; color: #606060; margin: 30px auto 0; padding: 20px 0; font-size: 12px; border-top: 2px solid #777777; overflow: hidden\">");
    	content.append("<div style=\"text-align: left; font-size: 12px; color: #383838; line-height: 18px\">");
    	content.append("<span style=\"color: #383838\">");
    	content.append(member.getMember_id());
    	content.append("</span>님,안녕하세요! <br> 고객님께서 사용하시는 계정 ");
    	content.append("(<span style=\"color: #383838\">");
    	content.append(member.getMember_id());
    	content.append("</span>)의 <span class=\"il\">임시 비밀번호</span> 발급을 요청하셨습니다.<br>");
    	content.append("<span class=\"il\">임시 비밀번호는</span>  ");
    	content.append(" <span style=\"color: #ff5544\">");
    	content.append(member.getPassword());
    	content.append(" </span>");
    	content.append(" 입니다.<br><span class=\"il\">반드시 </span> 로그인 후에 비빌번호 변경을 통해서 비밀번호를 변경해 주시기 바랍니다.");
    	content.append("</div>");
    	content.append("</div>");
    	content.append("<div class=\"adL\"></div>");
    	content.append("</div>");
    	
		return content.toString();
	}
    
    
	//마이 페이지
    @RequestMapping( value="mypage/info", method=RequestMethod.GET)
    public String myPage(Principal principal, Model model) throws Exception {
    	String member_id = principal.getName();
    	model.addAttribute("vo", service.selectmember(member_id));
    	logger.info("get mypage");
		return "member/mypage";
    	
    }
    //회원정보수정
    @RequestMapping( value="mypage/info", method=RequestMethod.POST)
    public String myPage(Principal principal, MemberVO member, MultipartFile file, HttpServletRequest request) throws Exception {
    	member.setMember_id(principal.getName());
    	member.setSt_picname(request.getParameter("st_picname"));
    	member.setOr_picname(request.getParameter("or_picname"));
    	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/member/profile_pic");
    	String savedName = null;
    	String originalFilename = file.getOriginalFilename();
    	// 프로필 사진 업로드 안할 시 원래 사진이름 적용
    	if (originalFilename.length() == 0) {
    		service.updatMember(member);    		
		} else {
			// 기존파일 삭제
			File deloFile = new File(uploadPath, member.getSt_picname());
			if( deloFile.exists() ) deloFile.delete();
			// 새로운 파일 저장
			savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			member.setOr_picname(originalFilename);
	    	member.setSt_picname(savedName);
			service.updatMember(member);
		}
    	logger.info("update member");
    	return "redirect:/member/mypage/info";
    	
    }
    
    
    
    //비밀번호 변경
    @RequestMapping( value="mypage/modify", method=RequestMethod.GET)
    public String modify(Model model, Principal principal) throws Exception {
    	String member_id = principal.getName();
    	model.addAttribute("vo", service.selectmember(member_id));
    	logger.info("get modify");
    	return "member/modify";
    }
    //비밀번호 수정
    @RequestMapping( value="mypage/modify", method=RequestMethod.POST)
    public String modify(Principal principal, MemberVO member) throws Exception {
    	System.out.println(principal.getName());
    	member.setMember_id(principal.getName());
    	service.updatePassword(member);
    	logger.info("update password");
    	return "redirect:/member/mypage/info";
    	
    }
    
    //회원 탈퇴
    @RequestMapping( value="mypage/delete", method=RequestMethod.GET)
    public String delete(Model model, Principal principal) throws Exception {
    	String member_id = principal.getName();
    	model.addAttribute("vo", service.selectmember(member_id));
    	logger.info("get deletemember");
    	return "member/delete";
    }
    
    @RequestMapping( value="mypage/delete", method=RequestMethod.POST)
    public String delete(Principal principal, MemberVO member, Model model) throws Exception {
    	member.setMember_id(principal.getName());
    	// 비밀번호 확인
    	boolean result = service.checkPw(member);
    	logger.info("deletemember");
    	if (result) {
    		System.out.println("비밀번호확인");
			service.deleteMember(member);
			return "redirect:../../logout";
		} else {
			model.addAttribute("message", "password_error");
			return "redirect:/member/mypage/delete";
		}
    	
    	
    }

}
