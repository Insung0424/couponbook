package sol.one.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.ImageVO;
import sol.one.VO.Page;
import sol.one.VO.PageDTO2;
import sol.one.VO.T_tradeVO;
import sol.one.service.CategoryService;
import sol.one.service.PageService;
import sol.one.service.TradeLogService;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/category/*")
public class CategoryController {
	
	private final CategoryService service;
	private final PageService pservice;
	private final TradeLogService tservice;
	
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
	public void detail(@RequestParam("product_id")int product_id, Model model) throws Exception {
		
		model.addAttribute("detail", service.detail(product_id));
	}
	
	@RequestMapping(value = "/getImg", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImg(String fileNameNPath) {
		// 테이블에서 열 값에 저장할때 이미지경로와 이름이 전체가 저장되므로 그 값을 받아서 파일을 생성함
		// ex)
		// C:\Users\agdis\Documents\workspace-sts-3.9.11.RELEASE\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\springTeamProject\resources\images\src\2022\09\07\c5ad886f.png
		File file = new File(fileNameNPath);

		ResponseEntity<byte[]> img = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			img = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return img;
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {}
	
	@GetMapping("/buyerTradeEnd")
	public void btrade() {}
	
	@GetMapping("/sellerTradeEnd")
	public void strade() {}
	
	@PostMapping("/postTrade")
	public ResponseEntity<String> putT(@RequestBody T_tradeVO vo) {
		System.out.println(vo);
		tservice.insertTradeLog(vo);
		
		String good = "good";
		ResponseEntity<String> data = new ResponseEntity<String>(good, HttpStatus.OK);
		return data;
	}
	
	@PostMapping("/postTrade2")
	public ResponseEntity<String> putT2(@RequestBody T_tradeVO vo) {
		
		System.out.println(vo);
		
		tservice.insertSellTradeLog(vo);
		int product_id = vo.getProduct_id();
		int pd_status = vo.getPd_status();
		tservice.update(product_id,pd_status);
		
		System.out.println("ok?");
		String good = "good";
		ResponseEntity<String> data = new ResponseEntity<String>(good, HttpStatus.OK);
		return data;
	}

}
