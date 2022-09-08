package sol.one.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import sol.one.VO.CommentVO;
import sol.one.VO.T_tradeVO;
import sol.one.service.TradeLogService;

@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	@Autowired
	private TradeLogService tradelogservice;

	@GetMapping("/main")
	public void main(Model model) {
		CommentVO vo = new CommentVO();
		vo.setUser_id(1);
		vo.setProduct_id(1);
		
		model.addAttribute("vo",vo);
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {}
	
	@GetMapping("/trade")
	public void trade() {}
	
	@PostMapping("/postTrade")
	public String putT(int pd_status) {
		//�쑀�� �븘�씠�뵒 諛쏆븘���꽌 �븯�룄濡� 蹂�寃쏀빐�빞�븿
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		tradelogservice.insertTradeLog(vo);
		
		return "redirect:/product/main";
	}
	
	@PostMapping("/postTrade2")
	public String putT2(int pd_status) {
		// �뙋留ㅼ옄媛� 嫄곕옒�셿猷뚮�� �꽑�깮�뻽�쓣 �떆 
		// �쑀�� �븘�씠�뵒 諛쏆븘���꽌 �븯�룄濡� 蹂�寃쏀빐�빞�븿
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		tradelogservice.insertTradeLog(vo);//嫄곕옒 �궡�뿭 �뀒�씠釉붿뿉 �뜲�씠�꽣 異붽�
		// �긽�뭹�뀒�씠釉붽낵 �뿰寃곕맂 �꽌鍮꾩뒪 �깮�꽦
		// �긽�뭹�뀒�씠釉붿뿉�꽌 嫄곕옒 �긽�깭 �뾽�뜲�씠�듃 �븘�슂
		
		return "redirect:/product/main";
	}
	
	@GetMapping("/new")
	public void new1() {}
	
	
	@GetMapping("/contentPage")
	public void contentpage() {}
	
}
