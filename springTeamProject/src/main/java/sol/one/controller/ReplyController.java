package sol.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import sol.one.VO.replyVO;
import sol.one.service.ReplyService;

@RequestMapping("/replies/")
@RestController
public class ReplyController {
	
	@Autowired
	@Qualifier(value = "ReplyService")
	private ReplyService service;
	
	@PostMapping("/new")
	public String subReply(@RequestBody replyVO vo) {
		service.register(vo);
		
		return "InsertSuccess";
	}
	
	@GetMapping("/get/{user_id}")
	public List<replyVO> getMyComment(@PathVariable int user_id){
		List<replyVO> list = service.getMyComment(user_id);
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/main");
		
		return list;
	}
}
