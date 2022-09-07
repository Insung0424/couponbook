package sol.one.controller;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import sol.one.VO.CommentVO;
import sol.one.service.CommentService;

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
	
	@GetMapping("/get/{product_id}")
	public Map<String,Object> getAllComment(@PathVariable int product_id,Model model){
		System.out.println("good?");
		List<CommentVO> list = service.getAllComment(product_id);
		ModelAndView view = new ModelAndView();
		view.setViewName("/product/main");
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
	
	@GetMapping("/get/comment")
	public Map<String,Object> getComment(int product_id,int user_id_1,int user_id_2,Model model){
		System.out.println("good?");
		Map<String,Object> map = new HashMap<>();
		
		int[] comment_no_level = service.getLevel(product_id,user_id_1);
		if(comment_no_level.length > 0) {
			
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/product/main");
			
			map.put("count", comment_no_level.length);
			
			List<CommentVO> list = service.getComment(product_id,user_id_1,user_id_2);
			map.put("list", list);
			return map;
		}
		else {
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/product/main");
			List<CommentVO> list = service.getComment(product_id,user_id_1,user_id_2);
			map.put("list", list);
			map.put("count", 0);
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
