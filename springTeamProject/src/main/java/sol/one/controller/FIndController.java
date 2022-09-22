package sol.one.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/find")
public class FIndController {
	
	@GetMapping("/idnpassword")
	public ModelAndView idnpassword(ModelAndView mv) {
		mv.setViewName("/find/idnpassword");
		return mv;
	}

}
