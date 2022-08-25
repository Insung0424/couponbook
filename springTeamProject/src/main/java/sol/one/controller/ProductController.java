package sol.one.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sol.one.VO.replyVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("/main")
	public void main(Locale locale,Model model) {
		replyVO vo = new replyVO();
		vo.setUser_id(1);
		vo.setProduct_id(1);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("vo",vo);
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {
	}
}
