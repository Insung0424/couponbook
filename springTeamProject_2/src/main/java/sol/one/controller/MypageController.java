package sol.one.controller;




import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.UserVO;
import sol.one.service.MypageService;


@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {


	private final MypageService service;
	
	
	@GetMapping("/user_id")
	@ResponseBody
	public String getUser_id(Principal p) {
		return p.getName();
	}
	
	//�׽�Ʈ�� �α���
	@PostMapping("/login")
	public String login(UserVO user,HttpServletRequest req,
			RedirectAttributes rttr)throws Exception{
		log.info("post login");
		HttpSession session=req.getSession();
		UserVO login=service.login(user);
		
		if (login==null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg",false);
		}else {
			session.setAttribute("user", login);
		}
		return "redirect:/";
	}
	//�׽�Ʈ�� �α׾ƿ�
	@GetMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	// �� ���� ��ȸ
	@GetMapping("/myInfo")
	public String myInfo(UserVO user, Model model) throws Exception {
		log.info(" Info");
		model.addAttribute("info", service.list_user_mypage(user.getUser_id()));
		

		return "mypage/myInfo";
	}
	
	// �� ���� ����â ȣ��(get)
	@GetMapping("/updateView")
	public String updateView() throws Exception {
		return "mypage/updateView";

	}
	
	// �� ���� ����
	@PostMapping("/update")
	public String update(UserVO user,HttpSession session) throws Exception{
		service.update_info_mypage(user);
		
		
		return "redirect:/";
	}
	
	// ȸ�� Ż��â ȣ��(get)
	@GetMapping("/delete_info_mypageView")
	public String delete_info_mypageView()throws Exception{
		return "mypage/deleteView";
	}
	
	//ȸ�� Ż��(post)
	@PostMapping("/delete_info_mypage")
	public String delete_info_mypage(UserVO vo,HttpSession session,
			RedirectAttributes rttr)throws Exception{
		

		UserVO user=(UserVO)session.getAttribute("user");

		String sessionPass=user.getPassword();

		String DTOPass=vo.getPassword();
		
		if (!(sessionPass.equals(DTOPass))) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/mypage/deleteView";
		}
		service.delete_info_mypage(vo);
		session.invalidate();
		return "redirect:/";
		
	}
	@GetMapping("/myReportView")
	public String myReportView() {
		return "mypage/myReport";
	}
	
	// �� �Ű���
	@PostMapping("/myReport")
	public String myReport(UserVO user,Model model)throws Exception{
		log.info(user.getUser_id()+" myReport");
		model.addAttribute("report",service.list_report_mypage(user.getUser_id()));
		
		return "mypage/myReport";
	}
	@GetMapping("/myLikeView")
	public String myLikeView() {
		return "mypage/myLike";
	}
	
	
	// �� ���ɻ�ǰ
	@PostMapping("/myLike")
	public String myLike(UserVO user,Model model) throws Exception {
		log.info(user.getUser_id()+" myLike");
		model.addAttribute("like",service.list_like_mypage(user.getUser_id()));
		
		return "mypage/myLike";
	}
	@GetMapping("/myTradeView")
	public String myTradeView() {
		return "mypage/myTrade";
	}
	// �� �ŷ����
	@PostMapping("/myTrade")
	public String myTrade(UserVO user,Model model) throws Exception {
		log.info(user.getUser_id()+" myTrade");
		model.addAttribute("trade",service.list_trade_mypage(user.getUser_id()));
		
		return "mypage/myTrade";
	}
//	// ���� �� �Խñ�(get)
//	@GetMapping("/myBoardView")
//	public String myBoardView() {
//		return "mypage/myBoard";
//	}
	// ���� �� �Խñ�(post)
	@GetMapping("/myBoard")
	public String myBoard(UserVO user,Model model) throws Exception {
		log.info(user.getUser_id()+" myBoard");
		model.addAttribute("board",service.list_board_mypage(user.getUser_id()));
		
		return "mypage/myBoard";
	}
	
	@GetMapping("/myCommentView")
	public String myCommentView() {
		return "mypage/myComment";
	}
	
	// ���� �� ���
	@PostMapping("/myComment")
	public String myComment(UserVO user,Model model)throws Exception {
		log.info(user.getUser_id()+" myComment");
		model.addAttribute("comment",service.list_comment_mypage(user.getUser_id()));
		return "mypage/myComment";
	}
	
	// ��й�ȣ üũ
	@ResponseBody
	@PostMapping("/check_password_mypage")
	public int check_password_mypage(UserVO user) throws Exception{
		int result = service.check_password_mypage(user);
		return result;
		
	}
}
