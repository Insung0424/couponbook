package sol.one.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import sol.one.VO.Comment2VO;
import sol.one.VO.CommentVO;
import sol.one.VO.MemberVO;
import sol.one.service.CommentService;
import sol.one.service.MemService;
import sol.one.service.TradeLogService;

@RequestMapping("/replies")
@RestController
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	@PostMapping("/new")
	public String insertReply(@RequestBody CommentVO vo) {
		System.out.println("ok?");
		service.register(vo);
		
		return "InsertSuccess";
	}
	
	@PostMapping("/tabComment")
	public String insert(@RequestBody CommentVO vo) {
		service.upNumber(vo);
		service.register_tab(vo);
		return "insert";
	}
	
	@GetMapping("/get")
	public Map<String,Object> getAllComment(@RequestParam("product_id")int product_id,Model model){
		System.out.println("good?");
		List<Comment2VO> list = service.getAllComment(product_id);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping("/get/comment")
	public Map<String,Object> getComment(int product_id,int user_id_1,int user_id_2,Model model){
		System.out.println("good?");
		Map<String,Object> map = new HashMap<>();
		
		int[] sellerComment_no_level = service.getLevel(product_id,user_id_2); // 판매자
		int[] buyerComment_no_level = service.getLevel(product_id,user_id_1); // 구매자
		ArrayList<Integer> arr = new ArrayList<Integer>();
		int size = -1;
		
		int seller = sellerComment_no_level.length;
		int buyer = buyerComment_no_level.length;
		
		if((seller != 0 && buyer != 0)&&(seller>=buyer)) {
			for(int i=0;i<seller;i++) {
				for(int j=0;j<buyer;j++) {
					int s = sellerComment_no_level[i];
					int t = buyerComment_no_level[j];
					if(s == t) {
						arr.add(s);
					}
				}
			}
			size = 0; // 겹치는 게 없을때
		}
//		else { //정신이 없이 만들어서 왜 만든건지 모르겠음
//			for(int i=0;i<buyer;i++) {
//				for(int j=0;j<seller;j++) {
//					if(buyerComment_no_level[i] == sellerComment_no_level[j]) {
//						arr.add(buyerComment_no_level[i]);
//					}
//				}
//			}
//			size = 0; // 겹치는 게 없을때
//		}
		
		if(arr != null) {
			size = arr.size();
		}
		
		if(size > 0) { // 정상출력
			
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/product/main");
			
			map.put("count", size);
			List<Comment2VO> list = new ArrayList<Comment2VO>();
			List<List> li = new ArrayList<List>();
			for(int i=0;i<size;i++) {
				int comment_no_level = buyerComment_no_level[i];
				list = service.getComment(product_id,user_id_1,user_id_2,comment_no_level);
				li.add(list);
			}
			map.put("list", li);
			return map;
		}
		else if(size == 0) { // 댓글 등록했으나 서로 답글단 상황은 아님
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/product/main");
			
			map.put("count", size);
			
			return map;
		}
		else { //아직 댓글 등록안함
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/product/main");
			map.put("count", size);
			return map;
		}
	}
	
	@DeleteMapping("/delete/{user_id}")
	public String del(@PathVariable int user_id) {
		service.remove(user_id);
		return "success";
	}
	
	@PutMapping("/update")
	public String put(@RequestBody CommentVO vo) {
		service.modify(vo);
		return "update";
	}
}
