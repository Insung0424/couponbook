package sol.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.service.CategoryService;



@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/category/*")
public class CategoryController {
	
	private final CategoryService service;
	
	@GetMapping("/list_all")
	public String list_all() {
		
		return "";
	}
	@GetMapping("/list_cat")
	public String list_cat(int category_id,Model model) throws Exception{
		model.addAttribute("list_cat",service.list_category(category_id));
		
		return "";
	}
}
