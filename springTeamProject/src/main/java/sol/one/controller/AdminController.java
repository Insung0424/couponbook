package sol.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.service.MemService;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	
	private MemService service;
	
	//관리자 로그인 시 관리자메인 페이지로 이동
	@GetMapping("/adminMain")
	public String adminMain(@ModelAttribute MemberVO member, HttpSession session, Model model) {
		log.info("adminPage s = " + session);
		log.info("adminPage s1 = " + session.getAttribute("admin"));
		
		return "/admin/adminMain";
	}
	
	//에러 페이지로 이동
	@GetMapping("/errorPage")
	public String errorPage(HttpSession session) {
		String msg = (String)session.getAttribute("msg");
		log.info("AC35: "+ msg);
		return "/errorPage";
	}
	
	//로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	

}
