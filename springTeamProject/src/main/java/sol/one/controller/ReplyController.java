package sol.one.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import sol.one.VO.replyVO;
import sol.one.service.ReplyService;

@RequestMapping("/replies")
@RestController
public class ReplyController {
	
	@Autowired
	@Qualifier(value = "ReplyService")
	private ReplyService service;
	
	@PostMapping("/new")
	public String insertReply(@RequestBody replyVO vo) {
		System.out.println("ok?");
		service.register(vo);
		
		return "InsertSuccess";
	}
	
	@GetMapping("/get/{user_id}")
	public Map<String,Object> getMyComment(@PathVariable int user_id,Model model){
		System.out.println("good?");
		List<replyVO> list = service.getMyComment(user_id);
		ModelAndView view = new ModelAndView();
		view.setViewName("/product/main");
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
}
