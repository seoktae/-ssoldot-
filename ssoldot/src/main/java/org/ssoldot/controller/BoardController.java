package org.ssoldot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.ssoldot.domain.BoardReplyVO;
import org.ssoldot.domain.BoardVO;
import org.ssoldot.domain.Criteria;
import org.ssoldot.domain.PageMaker;
import org.ssoldot.service.BoardService;
import org.ssoldot.service.BoardServiceImpl;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception{
		
		logger.info("register get.......");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("regist post...");
		logger.info(board.toString());
		
		service.regist(board);
		
//		리다이렉트시 result=success 문자열이 지워지지않고 남기 때문에
//		리다이렉트 시점에 한번만 사용되는 데이터를 전송할 수 있는 기능을 지원한다.
//		model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg","success");
		
		//return /board/sucess
		return "redirect:/board/listAll";
		
	}
	
//	전체 목록 조회 + 페이징 처리
	@RequestMapping("listAll")
	public void listPage(@ModelAttribute("cri") Criteria cri , Model model) throws Exception{
		
		logger.info(cri.toString());
		model.addAttribute("list",service.listAll(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker",pageMaker);
	}
	
	//글 상세
	@RequestMapping(value="read" , method=RequestMethod.GET)
	public void read(@RequestParam("b_id") int b_id, String member_id, Model model)throws Exception{
		
		Map<String, Object> mapParameter = new HashMap();
		mapParameter.put("b_id", b_id);
		mapParameter.put("member_id", member_id);
		System.out.println(mapParameter.toString());
		
		model.addAttribute(service.read(b_id));
		model.addAttribute(service.selectUserFile(mapParameter));
		
	}
	
	//글 삭제
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String remove(@RequestParam("b_id") int b_id, RedirectAttributes rttr) throws Exception{
			
		service.remove(b_id);
			
		rttr.addFlashAttribute("msg","success");
			
		return "redirect:/board/listAll";
			
	}
	
	//글 수정
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void modifyGET(int b_id, Model model) throws Exception{
			
		model.addAttribute(service.read(b_id));
		logger.info("listAll ~~~~");
	}
	
	//글 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
				
		logger.info("mod post....");
			
		service.modify(board);
		rttr.addFlashAttribute("msg","SUCCESS");
			
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	@ResponseBody
	public String ajax_addComment(@ModelAttribute("rvo") BoardReplyVO rvo, HttpServletRequest request ) throws Exception{
		/*
		로그인 작성자 받아오기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
		
		try{
			boardReplyVO.setMember_id(loginVO.getMember_id());
			boardServiceimpl.addComment(boardReplyVO);
		catch(Exception e){
            e.printStackTrace();
		}
		*/
		System.out.println(rvo.getB_id() +"@@"+rvo.getBr_content());
		service.insertBoardFirst(rvo);
		
		return "success";
	}
	
	@RequestMapping(value="/addComments", method=RequestMethod.POST)
	@ResponseBody
	public String ajax_addComments(@ModelAttribute("rvo") BoardReplyVO rvo, HttpServletRequest request ) throws Exception{
		/*
		로그인 작성자 받아오기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
		
		try{
			boardReplyVO.setMember_id(loginVO.getMember_id());
			boardServiceimpl.addComment(boardReplyVO);
		catch(Exception e){
            e.printStackTrace();
		}
		*/
		
		System.out.println(rvo.getBr_ref() + "@@" + rvo.getBr_step());
		System.out.println(rvo.getBr_depth() + "@@@" + rvo.getB_id() + "@@@@" + rvo.getBr_content());
		service.updateReplySetting(rvo);
		service.insertBoardAfter(rvo);
		
		return "success";
	}
	
	@RequestMapping(value="/board/commentList", produces="application/json; charset=utf8")
    @ResponseBody
    public ResponseEntity ajax_commentList(@ModelAttribute("b_id") Integer b_id, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        List<BoardReplyVO> commentVO = service.selectComment(b_id);
        if(commentVO.size() > 0){
            for(int i=0; i<commentVO.size(); i++){
                HashMap hm = new HashMap();
                hm.put("c_code", commentVO.get(i).getBr_id());
                hm.put("comment", commentVO.get(i).getBr_content());
                hm.put("writer", commentVO.get(i).getMember_id());
                hm.put("br_depth",commentVO.get(i).getBr_depth());
                hm.put("br_ref",commentVO.get(i).getBr_ref());
                hm.put("br_step",commentVO.get(i).getBr_step());
                hm.put("regdate",commentVO.get(i).getBr_regdate());
                
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray(hmlist);        
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }
	
}
