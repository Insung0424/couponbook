package sol.one.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.MemberVO;
import sol.one.VO.ProductVO;
import sol.one.service.CommentService;
import sol.one.service.LikeDAO;
import sol.one.service.PdtOneService;
import sol.one.service.ProductService;

@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class PdtOneController {
	
	//테스트용 메인연결, 상품 목록만 나옴
	private PdtOneService pdtService;
	private CommentService comService;
	
	@GetMapping("/mainTest") 
	public void main(ProductVO pdtVO, Model model) {
		System.out.println("product main 확인 ---  ");
		model.addAttribute("pdtList", pdtService.getPdtList() );
		System.out.println("product main pdtList : " + pdtService.getPdtList());
	}
	
	//쿠폰(상품) 상세 조회 : 1건 조회, product_id 기준
	@GetMapping("/pdtOne")
	public void pdtOne(@RequestParam("product_id") int product_id, Model model) {
		model.addAttribute("onePdt", pdtService.getOnePdt(product_id));
		
	}
	
	@GetMapping("/contentPage")
	public void contentpage(@RequestParam("product_id") int product_id, Model model) {
		model.addAttribute("onePdt", pdtService.getOnePdt(product_id));
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

}
