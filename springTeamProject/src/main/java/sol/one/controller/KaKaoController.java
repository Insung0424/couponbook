package sol.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import sol.one.VO.KakaoDTO;
import sol.one.service.KakaoMemService;

@Controller
@RequestMapping(value="/member/*")
@AllArgsConstructor
public class KaKaoController {
    @Autowired
    private KakaoMemService kakaoService;
    
    @Autowired
    private HttpSession session;
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        KakaoDTO userInfo = kakaoService.getUserInfo(access_Token);
        
        KakaoDTO number = kakaoService.kakaoNumber(userInfo);
        
        session.invalidate();
        session.setAttribute("kakaoN", userInfo.getK_name());
        session.setAttribute("kakaoE", userInfo.getK_email());
        session.setAttribute("kakaoNumber", number.getK_number());
//        return "/myPage";
		return "redirect:/loginMain";
    }
}