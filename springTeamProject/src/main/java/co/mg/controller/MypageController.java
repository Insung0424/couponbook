package co.mg.controller;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.mg.dto.UserDTO;
import co.mg.service.MypageService;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage/*")
public class MypageController {

	private static final Logger log = LoggerFactory.getLogger(MypageController.class);

	
	private final MypageService service;

	@PostMapping("mypage/myInfo")
	public String myInfo(@RequestParam(value="user_id") int user_id, Model model) throws Exception {
		log.info(user_id + " Info");
		model.addAttribute("info", service.list_user_mypage(user_id));
		

		return "mypage/myInfo";
	}

	@GetMapping("/updateView")
	public String updateView() throws Exception {
		return "mypage/updateView";

	}
	@PostMapping("/update")
	public String update(UserDTO user,HttpSession session) throws Exception{
		service.update_info_mypage(user);
		session.invalidate();
		
		return "redirect:/";
	}
	@PostMapping("/myReport")
	public String myReport(@RequestParam(value="user_id") int user_id,Model model)throws Exception{
		log.info(user_id+" myReport");
		model.addAttribute("report",service.list_report_mypage(user_id));
		
		return "mypage/myReport";
	}
	@PostMapping("/myLike")
	public String myLike(@RequestParam(value="user_id") int user_id,Model model) throws Exception {
		log.info(user_id+" myLike");
		model.addAttribute("like",service.list_like_mypage(user_id));
		
		return "mypage/myLike";
	}
	@PostMapping("/myTrade")
	public String myTrade(@RequestParam(value="user_id") int user_id,Model model) throws Exception {
		log.info(user_id+" myTrade");
		model.addAttribute("trade",service.list_trade_mypage(user_id));
		
		return "mypage/myTrade";
	}
	@PostMapping("/myBoard")
	public String myBoard(@RequestParam(value="user_id") int user_id,Model model) throws Exception {
		log.info(user_id+" myBoard");
		model.addAttribute("board",service.list_board_mypage(user_id));
		
		return "mypage/myBoard";
	}
	@PostMapping("/myComment")
	public String myComment(@RequestParam(value="user_id")int user_id,Model model)throws Exception {
		log.info(user_id+" myComment");
		model.addAttribute("comment",service.list_comment_mypage(user_id));
		return "mypage/myComment";
	}
	
}
