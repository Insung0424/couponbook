package sol.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import sol.one.VO.CommentVO;
import sol.one.VO.T_tradeVO;
import sol.one.service.TradeLogService;

@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	@Autowired
	private TradeLogService service;

	@GetMapping("/main")
	public void main(Model model) {
		CommentVO vo = new CommentVO();
		vo.setUser_id(2);
		vo.setProduct_id(1);
		
		model.addAttribute("vo",vo);
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {}
	
	@GetMapping("/trade")
	public void trade() {}
	
	@PostMapping("/postTrade")
	public String putT(int pd_status) {
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		service.insertTradeLog(vo);
		
		return "redirect:/product/main";
	}
}
