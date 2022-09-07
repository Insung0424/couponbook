package sol.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.Page;
import sol.one.VO.PageDTO2;
import sol.one.VO.PageVO;
import sol.one.service.PageService;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/page/*")
public class PageController {
	
	private final PageService service;
	
	@GetMapping("/list")
	public void list(Model m, Page p) {
		
		m.addAttribute("list", service.getPage(p));
		m.addAttribute("pp", new PageDTO2(p, service.getTotal(p)));

	}
	@GetMapping("/submit")
	public void sub() {}
	

	@PostMapping("/submit")
	public String submit(PageVO pv, RedirectAttributes rt) {
		
		Integer board_no=service.submit(pv);
		
		rt.addFlashAttribute("result", board_no);
		
		return "redirect:/page/list";
				
	}
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("board_no") int board_no, @ModelAttribute("p") Page p, Model m ) {
		m.addAttribute("page" ,service.get(board_no));
	}
	
	
	@PostMapping("/modify")
	public String modify(PageVO pv, Page p, RedirectAttributes rt) {

		if(service.modify(pv)==1) {
			rt.addFlashAttribute("result", "성공");
			
		}
		 rt.addAttribute("pNum", p.getPNum());
		 rt.addAttribute("amount", p.getAmount());
		 rt.addAttribute("type", p.getType());
		 rt.addAttribute("keyword", p.getKeyword());
		return "redirect:/page/list";
	}
	
	@PostMapping("/del")
	public String del(@RequestParam("board_no")int board_no, Page p, RedirectAttributes rt) {
		
		if(service.del(board_no)==1) {
			rt.addFlashAttribute("result","성공");
		}
		
		rt.addAttribute("pNum", p.getPNum());
		rt.addAttribute("amount", p.getAmount());
		rt.addAttribute("type", p.getType());
		rt.addAttribute("keyword", p.getKeyword());
		return "redirect:/page/list";
		
	}
	
	
}








