package sol.one.controller;




import java.net.PasswordAuthentication;
import java.security.Principal;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import sol.one.VO.CommentVO;
import sol.one.VO.MemberVO;
import sol.one.VO.ReportVO;
import sol.one.service.MypageService;


@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {


	private final MypageService service;
		

//	//로그인(없어도됨)
//	@PostMapping("/login")
//	public String login(MemberVO mem,HttpServletRequest request,
//			RedirectAttributes rttr)throws Exception{
//		log.info("post login");
//		HttpSession session=request.getSession();
//		
//		UserVO login=service.login(mem);
//			
//		if (login==null) {
//			session.setAttribute("user", null);
//			rttr.addFlashAttribute("msg",false);
//		}else {
//			session.setAttribute("user", login);
//
//		}
//		return "redirect:/";
//	}
//	//로그아웃(없어도됨)
//	@GetMapping("/logout")
//	public String logout(HttpSession session)throws Exception{
//		session.invalidate();
//		
//		return "redirect:/";
//	}

	// 내 정보보기
	@PostMapping("/myInfo")
	public String myInfo(MemberVO mem, HttpSession session) throws Exception {
		log.info(" Info");
		return "mypage/myInfo";
	}
	
	// 내 정보 수정페이지 창(get)
	@GetMapping("/updateView")
	public String updateView() throws Exception {
		return "mypage/updateView";

	}
	
	// 내 정보 수정페이지에서 수정기능 실행
	@PostMapping("/update")
	public String update(MemberVO mem,HttpSession session) throws Exception{
		service.update_info_mypage(mem);
//		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원 탈퇴 창(get)
	@GetMapping("/delete_info_mypageView")
	public String delete_info_mypageView()throws Exception{
		return "mypage/deleteView";
	}
	
	//회원 탈퇴창에서 탈퇴기능 실행
	@PostMapping("/delete_info_mypage")
	public String delete_info_mypage(Long user_id,HttpSession session,
			RedirectAttributes rttr)throws Exception{
		
		service.delete_info_mypage(user_id);
		session.invalidate();
		rttr.addFlashAttribute("msg","회원 탈퇴 성공했습니다");
		return "redirect:/";
		
	}
	//내 신고목록
	@PostMapping("/myReport")
	public String myReport(@RequestParam(required = false, value="session_user_id")Long user_id,Model model,
			HttpSession session)throws Exception{
		log.info(user_id+" myReport");
		model.addAttribute("report",service.list_report_mypage(user_id));
		return "mypage/myReport";
	}
	
	// 내 관심목록
	@PostMapping("/myLike")
	public String myLike(@RequestParam(required = false, value="session_user_id")Long user_id,Model model,
			HttpSession session) throws Exception {
		log.info(user_id+" myLike");
		model.addAttribute("like",service.list_like_mypage(user_id));
		
		return "mypage/myLike";
	}
//	@GetMapping("/myTradeView")
//	public String myTradeView() {
//		return "mypage/myTrade";
//	}
	//내 거래목록
	@PostMapping("/myTrade")
	public String myTrade(@RequestParam(required = false, value="session_user_id")Long user_id,Model model,
			HttpSession session) throws Exception {

		model.addAttribute("trade",service.list_trade_mypage(user_id));
		
		return "mypage/myTrade";
	}


//	@PostMapping("/myBoard")
//	public String myBoardView(BoardVO boardVO, Model model) throws Exception {
//		
////		List<BoardVO> list=service.list_board_mypage(user_id);
////		model.addAttribute("board",service.list_board_mypage(boardVO.getUser_id()));
//		return "mypage/myBoard";
//	}
	// 내 게시글목록
	@PostMapping("/myBoard")
	public String myBoard(@RequestParam(required = false, value="session_user_id")Long user_id,Model model,
			HttpSession session) throws Exception {
		model.addAttribute("board",service.list_board_mypage(user_id));
		return "mypage/myBoard";
	}
	
//	@GetMapping("/myCommentView")
//	public String myCommentView() {
//		return "mypage/myComment";
//	}
	
	//내 댓글목록
	@PostMapping("/myComment")
	public String myComment(@RequestParam(required = false, value="session_user_id")Long user_id,Model model,HttpSession session)throws Exception {
		log.info(user_id+" myComment");
		model.addAttribute("comment",service.list_comment_mypage(user_id));
		return "mypage/myComment";
	}
	//비밀번호 체크
	@ResponseBody
	@PostMapping("/check_password_mypage")
	public int check_password_mypage(MemberVO user) throws Exception{
		int result= service.check_password_mypage(user);
		return result;
	}
	
	//신고
	@PostMapping("/goReport")
	public String goReport() {
		return "mypage/goReport";
	}
	//신고메일발송
	@PostMapping("/sendEmail")
	public String sendEmail(ReportVO report,String email,String re_title,String re_content,HttpServletRequest request,
			HttpServletResponse response,HttpSession httpsession) throws Exception {
			
		//smtp 설정되어있는 계정의 아이디와 비밀번호
		String host="smtp.naver.com";
		final String username="skandy55";
		final String password="sprtms55'";
		int port=465;
				
		//관리자 메일
		String recipient = "skandy55@naver.com";
			
		String subject=re_title;
		String body=re_content;
		
		Properties props=System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.starttls.enable", true);
		
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message message= new MimeMessage(session);
				
		//문제코드
		message.setFrom(new InternetAddress("skandy55@naver.com"));
		//
		
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		message.setSubject(email+"님의 신고 : "+subject);
		message.setText(body);
		Transport.send(message);
		service.go_report(report);
		return "redirect:/";
	}
	
}
