package sol.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.service.SortService;


@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/sort/*")
public class SortController {

	private final SortService service;
	
	//상품의 정렬 담당하는 클래스
	
	@GetMapping("/time_desc")
	public void time_desc(Model model) throws Exception {
		model.addAttribute("time_desc",service.list_time_desc());	
	}
	@GetMapping("/time_asc")
	public void time_asc(Model model) throws Exception{
		model.addAttribute("time_asc",service.list_time_asc());
	}
	@GetMapping("/discount_desc")
	public void discount_desc(Model model) throws Exception{
		model.addAttribute("discount_desc",service.list_discount_desc());
	}
	@GetMapping("/discount_asc")
	public void discount_asc(Model model) throws Exception{
		model.addAttribute("discount_asc",service.list_discount_desc());
	}
	@GetMapping("/price_desc")
	public void price_desc(Model model) throws Exception{
		model.addAttribute("price_desc",service.list_price_desc());
	}
	@GetMapping("/price_asc")
	public void price_asc(Model model) throws Exception{
		model.addAttribute("price_asc",service.list_price_asc());
	}
}
