package sol.one.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.Criteria;
import sol.one.VO.MemberVO;
import sol.one.VO.PageDTO;
import sol.one.VO.T_tradeVO;
import sol.one.service.ChartService;
import sol.one.service.MemService;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	
	private MemService service;
	private ChartService chartService;

	//관리자 로그인 시 관리자메인 페이지로 이동
	@GetMapping("/admin/adminMain")
	public void adminMain(HttpSession session, 
			T_tradeVO tvo, Model model) {
		System.out.println("adminPage s1 = " + session);
		
		model.addAttribute("tradeList", chartService.tradeWeek(tvo) );
	}
	
	//차트: 1주일 거래목록 가져오기
	@RequestMapping("/tradeWeek")
	public @ResponseBody List<T_tradeVO> tradeWeek(Model model, T_tradeVO tvo) {
		List<T_tradeVO> trade = chartService.tradeWeek(tvo);
		model.addAttribute("trade",trade);
		return trade;
	}
	//차트: 1주일 거래 건수 가져오기
	@RequestMapping("/tradeWeekCnt")
	public @ResponseBody int[] tradeWeekCnt(Model model, T_tradeVO tvo, Criteria cri) {
		int[] tradeCnt = chartService.tradeWeekCnt(tvo);
		
		System.out.println("AC50: "+chartService.tradeWeekCnt(tvo));
		System.out.println("AC51 tradeCnt: "+tradeCnt);
		
		model.addAttribute("tradeCnt",tradeCnt);
		return tradeCnt;
	}
	
	
	//거래목록 페이지로 이동
	@GetMapping("/admin/trdAllPage")
	public void trdAllPage(HttpSession session, Criteria cri, Model model) {
		System.out.println("AllList: "+ cri);
		model.addAttribute("tradeAll", chartService.tradeAllList(cri));

		int total = chartService.getTotalTrdCnt(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//거래 목록 전체 가져오기
	@GetMapping("/tradeAllList")
	public List<T_tradeVO> tradeAllList(Model model, T_tradeVO tvo, Criteria cri){
		List<T_tradeVO> tradeAll = chartService.tradeAllList(cri);
		model.addAttribute("tradeAll", tradeAll);
		return tradeAll;
	} 
	
	
	//회원목록 페이지로 이동
	@GetMapping("/admin/memList")
	public void memList(Criteria cri, Model model) {
		model.addAttribute("memAllList", chartService.getMemList(cri));
		int total = chartService.getTotalMemCnt(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//회원 상세 조회
	@GetMapping("/admin/getMem")
	public void getMem(@RequestParam("email") String email, Model model) {
		model.addAttribute("oneMem", service.adminGetMem(email));
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
