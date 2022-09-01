package sol.one.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sol.one.VO.CommentVO;
import sol.one.VO.T_tradeVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("/main")
	public void main(Locale locale,Model model) {
		CommentVO vo = new CommentVO();
		vo.setUser_id(2);
		vo.setProduct_id(1);
		
		model.addAttribute("vo",vo);
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {}
	
	@GetMapping("/trade")
	public void trade() {}
	
	@PostMapping("/putTrade")
	public void putT(int pd_status) {
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(1);
		vo.setSell_user_id(3);
	}
}
