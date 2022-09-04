package sol.one.controller;




import java.net.PasswordAuthentication;
import java.security.Principal;
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

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.BoardVO;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.ReportVO;
import sol.one.VO.TradeVO;
import sol.one.VO.UserVO;

import sol.one.service.MypageService;


@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {


	private final MypageService service;
		

	//�׽�Ʈ�� �α���
	@PostMapping("/login")
	public String login(UserVO user,HttpServletRequest req,
			RedirectAttributes rttr)throws Exception{
		log.info("post login");
		HttpSession session=req.getSession();
		
		UserVO login=service.login(user);
		BoardVO board=service.list_board_mypage(user.getUser_id());
		CommentVO comment=service.list_comment_mypage(user.getUser_id());
		LikeVO like=service.list_like_mypage(user.getUser_id());
		TradeVO trade=service.list_trade_mypage(user.getUser_id());
		ReportVO report=service.list_report_mypage(user.getUser_id());
			
		if (login==null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg",false);
		}else {
			session.setAttribute("user", login);
			session.setAttribute("board", board);
			session.setAttribute("comment", comment);
			session.setAttribute("like", like);
			session.setAttribute("trade", trade);
			session.setAttribute("report", report);
		}
		return "redirect:/";
	}
	//�׽�Ʈ�� �α׾ƿ�
	@GetMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	// 내 정보보기
	@PostMapping("/myInfo")
	public String myInfo(UserVO user, HttpSession session) throws Exception {
		log.info(" Info");
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
		
		
//		session.invalidate();
		
		return "redirect:/";
	}
	

	@GetMapping("/delete_info_mypageView")
	public String delete_info_mypageView()throws Exception{
		return "mypage/deleteView";
	}
	
	//ȸ�� Ż��(post)
	@PostMapping("/delete_info_mypage")
	public String delete_info_mypage(int user_id,HttpSession session,
			RedirectAttributes rttr)throws Exception{
		
		service.delete_info_mypage(user_id);
		session.invalidate();
		rttr.addFlashAttribute("msg","회원 탈퇴 성공했습니다");
		return "redirect:/";
//		UserVO user=(UserVO)session.getAttribute("user");
//
//		String sessionPass=user.getPassword();
//
//		String VOPass=vo.getPassword();
//		
//		if (!(sessionPass.equals(VOPass))) {
//			rttr.addFlashAttribute("msg",false);
//			return "redirect:/mypage/deleteView";
//		}
//		service.delete_info_mypage(vo);
//		session.invalidate();
//		return "redirect:/";
		
	}
//	@GetMapping("/myReportView")
//	public String myReportView() {
//		return "mypage/myReport";
//	}
	
	// �� �Ű���
	@PostMapping("/myReport")
	public String myReport(UserVO user,HttpSession session)throws Exception{
		log.info(user.getUser_id()+" myReport");
		
		
//		model.addAttribute("report",service.list_report_mypage(user.getUser_id()));
//		ReportVO myreport=service.list_report_mypage(user.getUser_id());
//		session.setAttribute("reports", myreport);
		return "mypage/myReport";
	}
//	@GetMapping("/myLikeView")
//	public String myLikeView() {
//		return "mypage/myLike";
//	}
	
	
	// �� ���ɻ�ǰ
	@PostMapping("/myLike")
	public String myLike(UserVO user,Model model,HttpSession session) throws Exception {
		log.info(user.getUser_id()+" myLike");
//		model.addAttribute("like",service.list_like_mypage(user.getUser_id()));
		
		return "mypage/myLike";
	}
//	@GetMapping("/myTradeView")
//	public String myTradeView() {
//		return "mypage/myTrade";
//	}
	// �� �ŷ����
	@PostMapping("/myTrade")
	public String myTrade(UserVO user,Model model,HttpSession session) throws Exception {
		log.info(user.getUser_id()+" myTrade");
//		model.addAttribute("trade",service.list_trade_mypage(user.getUser_id()));
		
		return "mypage/myTrade";
	}
//	// ���� �� �Խñ�(get)
//	@GetMapping("/myBoardView")
//	public String myBoardView() {
//		return "mypage/myBoard";
//	}
	// ���� �� �Խñ�(post)
	@PostMapping("/myBoard")
	public String myBoard(UserVO user,Model model,HttpSession session) throws Exception {
		log.info(user.getUser_id()+" myBoard");
		
//		BoardVO board=(BoardVO) session.getAttribute("user");
//		BoardVO myboard=service.list_board_mypage(user.getUser_id());
//		session.setAttribute("boards", myboard);

	
		return "mypage/myBoard";
	}
	
//	@GetMapping("/myCommentView")
//	public String myCommentView() {
//		return "mypage/myComment";
//	}
	
	// ���� �� ���
	@PostMapping("/myComment")
	public String myComment(UserVO user,Model model,HttpSession session)throws Exception {
		log.info(user.getUser_id()+" myComment");
//		model.addAttribute("comment",service.list_comment_mypage(user.getUser_id()));
		return "mypage/myComment";
	}
	
	@ResponseBody
	@PostMapping("/check_password_mypage")
	public int check_password_mypage(UserVO user) throws Exception{
		int result= service.check_password_mypage(user);
		return result;
	}
	
	@GetMapping("/goReport")
	public String goReport() {
		return "mypage/goReport";
	}
	
	@PostMapping("/sendEmail")
	public void sendEmail(UserVO user,String title,String content,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String host="smtp.naver.com";
		final String username="skandy57";
		final String password="sprtms55'";
		int port=465;
		
		String recipient = "couponbook@naver.com";
		String subject=title;
		String body=content;
		
		Properties props=System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message message= new MimeMessage(session);
		message.setFrom(new InternetAddress("CouponBook@naver.com"));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		message.setSubject(subject);
		message.setText(body);
		Transport.send(message);
		
	}
	
}
