package sol.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import sol.one.VO.ProductVO;
import sol.one.service.PdtOneService;

@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class PdtOneController {
	
	//테스트용 메인연결, 상품 목록만 나옴
	private PdtOneService pdtService;
	
	@GetMapping("/mainTest") 
	public void main(ProductVO pdtVO, Model model) {
		System.out.println("product main 확인 ---  ");
		model.addAttribute("pdtList", pdtService.getPdtList() );
		System.out.println("product main pdtList : " + pdtService.getPdtList());
	}
	
	//쿠폰(상품) 상세 조회 : 1건 조회, product_id 기준
	@GetMapping("/pdtOne")
	public void pdtOne(@RequestParam("product_id") String pdtId, Model model) {
		model.addAttribute("onePdt", pdtService.getOnePdt(pdtId));
	}

}
