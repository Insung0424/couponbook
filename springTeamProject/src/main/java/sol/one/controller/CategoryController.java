package sol.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.Page;
import sol.one.VO.PageDTO2;
import sol.one.service.CategoryService;
import sol.one.service.PageService;
import sol.one.service.PdtOneService;



@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/category/*")
public class CategoryController {
	
	private final CategoryService service;
	private final PageService pservice;
	
	@GetMapping("/all")
	public void list_all(Model model,Page p) throws Exception {
		model.addAttribute("list_all",service.list_all_category());
		model.addAttribute("count_all", service.count_all());
		model.addAttribute("list",pservice.getPage(p));
		model.addAttribute("pp", new PageDTO2(p,pservice.getTotal(p)));

		
	}
	@GetMapping("/category")
	public void list_cat(int category_id,Model model,Page p) throws Exception{
		model.addAttribute("list_cat",service.list_category(category_id));
		model.addAttribute("count_category", service.count_category(category_id));
		model.addAttribute("list",pservice.getPage(p));
		model.addAttribute("pp", new PageDTO2(p,pservice.getTotal(p)));
	}

	@GetMapping("/detail")
	public void detail(int product_id, Model model,Page p) throws Exception {
		
		model.addAttribute("detail", service.detail(product_id));
		model.addAttribute("list",pservice.getPage(p));
		model.addAttribute("pp", new PageDTO2(p,pservice.getTotal(p)));
		
	}

}
