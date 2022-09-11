package sol.one.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@GetMapping("/buyerTradeEnd")
	public void btrade() {}
	
	@GetMapping("/sellerTradeEnd")
	public void strade() {}
	
	@PostMapping("/postTrade")
	public String putT(int pd_status) {
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		tradelogservice.insertTradeLog(vo);
		
		return "redirect:/product/main";
	}
	
	@PostMapping("/postTrade2")
	public String putT2(int pd_status) {
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		tradelogservice.insertTradeLog(vo);
		
		return "redirect:/product/main";
	}
	
	@GetMapping("/new")
	public void new1() {}
	
	
	@GetMapping("/contentPage")
	public void contentpage() {}
	
}
