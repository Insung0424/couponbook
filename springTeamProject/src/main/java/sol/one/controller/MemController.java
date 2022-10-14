package sol.one.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.service.MemService;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemController {
	
	private MemService service;
	
	
	//�쉶�썝媛��엯 �뤌�쑝濡� �씠�룞
	@GetMapping("/join")
	public void joinForm() {}
	
	//�쉶�썝媛��엯 泥섎━
	@PostMapping("/joinProc")
	public String joinProc(@Valid MemberVO member, BindingResult r, HttpSession session) {
		log.info("1. joinProc member ========== " + member);
		if(r.hasErrors()) {
			return "/join";
		}
		
		//媛��엯�맂 硫붿씪�씤吏� �솗�씤 �썑 以묐났�씠硫� 媛��엯 �븞�맖
		  int chkMail = service.mailChk(member.getEmail()); 
		  if(chkMail != 0) {
			/* System.out.println("MC81: 媛��엯�맂 硫붿씪�엯�땲�떎"); return "/member/join"; */ 
				session.setAttribute("msg", "�씠誘� 媛��엯�맂 硫붿씪�엯�땲�떎");
				return "/errorPage";
		  } else {
			  service.registerMem(member); 
			  return "redirect:/member/login"; 
		  }
	}
	
	//硫붿씪 以묐났 �솗�씤
	@PostMapping("/mailChk")
	@ResponseBody
	public int mailChk(@RequestParam("email") String email) {
		System.out.println("�꽆�뼱�삩 硫붿씪 媛�: "+email);

		int result = service.mailChk(email);
		System.out.println("諛섑솚諛쏆� 泥댄겕 媛�: "+result);
		return result; 
	}
	
	//濡쒓렇�씤 �뤌�쑝濡� �씠�룞
	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}
	
	//濡쒓렇�씤 泥섎━
	@PostMapping("/loginProc")
	public String loginProc( @ModelAttribute MemberVO member, HttpSession session) {
		
		MemberVO loginMem = service.getMemById(member);
		log.info("loginProc loginMem = " + loginMem);
		
		if(loginMem == null) {
			//濡쒓렇�씤 �떎�뙣 �떆 寃쎄퀬硫붿떆吏��� �럹�씠吏� �씠�룞
			session.setAttribute("msg", "�븘�씠�뵒�� 鍮꾨�踰덊샇瑜� �솗�씤�븯�꽭�슂");
			return "/errorPage";
		} else if(loginMem.getUser_grade() == 2) {
			//濡쒓렇�씤 �꽦怨� �븳 �궗�슜�옄�쓽 �벑湲됱씠 1(�씪諛섑쉶�썝)�씠 �븘�땶 寃쎌슦 = 愿�由ъ옄 �븘�씠�뵒濡� 濡쒓렇�씤 �뻽�쓣 寃쎌슦
			session.setAttribute("admin", loginMem);
			return "redirect:/admin/adminMain";
		} else if(loginMem.getUser_grade() == 1) {
			// 濡쒓렇�씤 �꽦怨� �븯硫� service�뿉�꽌 諛섑솚 諛쏆� loginMem �쓣 �꽭�뀡�뿉 �떞�븘�꽌 硫붿씤 �럹�씠吏�濡� �씠�룞�븳�떎
			session.setAttribute("mem", loginMem);
			return "redirect:/category/all";
		} else if(loginMem.getUser_grade() == 0) {
			session.setAttribute("msg", "회원탈퇴한 계정입니다.");
			return "/errorPage1";
		} else{
			session.setAttribute("msg", "비정상적인 활동으로 제재를 받아 로그인이 제한됩니다.");
			return "/errorPage2";
		}
	}
	
	//留덉씠�럹�씠吏� �씠�룞
	@GetMapping("/myPage")
	public String myPage(@ModelAttribute MemberVO member, HttpSession session, Model model) {
		log.info("myPage s = " + session);
		log.info("myPage s1 = " + session.getAttribute("mem"));
		
//		�씤�꽣�뀎�꽣 �꽕�젙
		model.addAttribute( session.getAttribute("mem") );
		
		return "/member/myPage";
	}
	
	//濡쒓렇�븘�썐 泥섎━
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	

}
