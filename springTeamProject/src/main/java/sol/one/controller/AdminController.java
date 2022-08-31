package sol.one.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.VO.T_tradeVO;
import sol.one.service.ChartService;
import sol.one.service.MemService;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	
	private MemService service;
	private ChartService chartService;
	
	
	//차트: 1주일 거래목록 가져오기
	@RequestMapping("/tradeWeek")
	public @ResponseBody List<T_tradeVO> tradeWeek(Model model, T_tradeVO tvo) {
		List<T_tradeVO> trade = chartService.tradeWeek(tvo);
		model.addAttribute("trade",trade);
		return trade;
	}
	//차트: 1주일 거래 건수 가져오기
	@RequestMapping("/tradeWeekCnt")
	public @ResponseBody int[] tradeWeekCnt(Model model, T_tradeVO tvo) {
//		public @ResponseBody List<T_tradeVO> tradeWeekCnt(Model model, T_tradeVO tvo) {
		int[] tradeCnt = chartService.tradeWeekCnt(tvo);
		
		System.out.println("AC41: "+chartService.tradeWeekCnt(tvo));
		System.out.println("AC42 tradeCnt: "+tradeCnt);
		
		model.addAttribute("tradeCnt",tradeCnt);
		return tradeCnt;
	}
	

	//거래목록 전체 가져오기
	@GetMapping("/trdAllList")
	public String tradeAllList() {
		return "/admin/trdAllList";
	}
	
	
	//관리자 로그인 시 관리자메인 페이지로 이동
	@GetMapping("/adminMain")
	public String adminMain(HttpSession session, 
			T_tradeVO tvo, Model model) {
		log.info("adminPage s1 = " + session);
		
		model.addAttribute("tradeList", chartService.tradeWeek(tvo) );
		
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
