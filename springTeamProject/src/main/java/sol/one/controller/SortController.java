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
	
	@GetMapping("/")
	public void sort(Model model) throws Exception {
		model.addAttribute("time_desc",service.list_time_desc());
		model.addAttribute("time_asc",service.list_time_asc());
		model.addAttribute("discount_desc",service.list_discount_desc());
		model.addAttribute("discount_asc",service.list_discount_asc());
		model.addAttribute("price_desc",service.list_price_desc());
		model.addAttribute("price_asc",service.list_price_asc());
	}
}
