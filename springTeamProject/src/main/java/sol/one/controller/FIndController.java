package sol.one.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.service.FindService;

@RestController
@Log4j
@RequestMapping("/find")
public class FIndController {
	
	@Autowired
	private FindService service;
	
	@GetMapping("/idnpassword")
	public ModelAndView idnpassword(ModelAndView mv) {
		mv.setViewName("/find/idnpassword");
		return mv;
	}
	
	@PostMapping("/findIdNickname")
	public ModelAndView findIdn(ModelAndView mv, String nickname) {
		String nick = service.getIdnickname(nickname);
		
		if(nick == null) {
			mv.setViewName("/find/NOdata");
			String result = "해당닉네임으로 검색된 결과가 없습니다";
			mv.addObject("result", result);
			return mv;
		}
		
		mv.setViewName("/find/findIdResult");
		mv.addObject("result", nick);
		return mv;
	}
	
	@PostMapping("/findIdPhone")
	public ModelAndView findIdp(ModelAndView mv, String phone) {
		String p = service.getIdphone(phone);
		
		if(p == null) {
			mv.setViewName("/find/NOdata");
			String result = "해당전화번호로 검색된 결과가 없습니다";
			mv.addObject("result", result);
			return mv;
		}
		
		mv.setViewName("/find/findIdResult");
		mv.addObject("result", p);
		return mv;
	}
	
	
	@PostMapping("/checknicknamenemail")
	public ModelAndView findIdp(ModelAndView mv, MemberVO vo) {
		if(service.checkIdnNickname(vo) == 0) {
			mv.setViewName("/find/NOdata");
			String result = "해당정보로 검색된 결과가 없습니다";
			mv.addObject("result", result);
			return mv;
		}
		
		mv.setViewName("find/updatePassword");
		mv.addObject("mem", vo);
		return mv;
	}

	@GetMapping("/updatePassword")
	public ModelAndView updatePassword(ModelAndView mv){
		mv.setViewName("/find/updatePassword");
		return mv;
	}	
	
	@PostMapping("/changepw")
	public String chagepassword(MemberVO vo) {
		
		if(service.updateNewPassword(vo) == 0) {
			String fail = "<script> alert('비밀번호를 변경할 수 없습니다. 다시한번 확인해주세요.'); document.location.href='/'; </script>";
			return fail;
		}
		
		String pass = "<script> alert('비밀번호가 변경되었습니다.'); document.location.href='/'; </script>";
		return pass;
	}
	
}
