package sol.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
		
		return "/member/main";
	}
	
}
