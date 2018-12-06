package com.budong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.budong.model.dto.MemberDTO;
import com.budong.service.interfaces.MainService;

/**
 * 
 * @author wjddp 회원 가입 및 로그인 페이지
 */
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	private MainService service;

	@Autowired
	public MemberController(MainService service) {
		this.service = service;
	}
 
	// 회원 가입
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(HttpServletRequest req) throws Exception {
		logger.info("InsertMember");
		/*MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("mem_img");
		String filename = mf.getOriginalFilename();
		String upPath = session.getServletContext().getRealPath("/resources/images");

		File file = new File(upPath, filename);
		mf.transferTo(file);*/

		MemberDTO dto = new MemberDTO();
		dto.setMem_id(req.getParameter("mem_id"));
		dto.setMem_img("");
		dto.setMem_name(req.getParameter("mem_name"));
		dto.setMem_pw(req.getParameter("mem_pw"));
		dto.setMem_region(req.getParameter("mem_region"));

		service.insertMember(dto);
		return "redirect:chatHome.do";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/loginHome.do")
	public String loginHome() {
		return "member/memberLogin";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw,
			HttpServletRequest req) {

		HttpSession session = req.getSession();
		MemberDTO memberDTO = service.login(mem_id, mem_pw);

		if (memberDTO == null) { // 로그인 실패
			logger.info("로그인 실패");
			return "redirect:memberJoin.do";
		} else {
			// 로그인 성공
			// 사용자의 아이디, 프로필사진, 이름, 거주지역을 세션에 저장 
			logger.info("로그인 성공");
			session.setAttribute("userId", memberDTO.getMem_id());
			session.setAttribute("userImg", memberDTO.getMem_img());
			session.setAttribute("userName", memberDTO.getMem_name());
			session.setAttribute("userRegion", memberDTO.getMem_region());
			session.setAttribute("roomName", null);
			return "redirect:chatHome.do";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest req) {
		logger.info("로그아웃");
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:chatHome.do";
	}

}
